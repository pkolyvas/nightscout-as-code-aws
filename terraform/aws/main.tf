# Source for the VPC Module:
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/3.14.2
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "nightscout-vpc"
  cidr = "10.223.0.0/16"

  # If you changed the region above you'll need to change these availability zones (AZs)
  # to match. You can get by using the "a" and "b" availability zones without too much worry.
  azs = ["us-east-2a", "us-east-2b"]

  private_subnets = ["10.223.1.0/24", "10.223.2.0/24"]
  public_subnets  = ["10.223.3.0/24", "10.223.4.0/24"]

  enable_nat_gateway = false
}

# Source for the key-pair module: 
# https://registry.terraform.io/modules/terraform-aws-modules/key-pair/aws/2.0.0
module "launch_key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  version            = "2.0.0"
  key_name           = "nightscout-deploy"
  create_private_key = true
}

module "security_groups" {
  source = "./security_groups/"
  vpc_id = module.vpc.vpc_id
}

# This is our Nightscount Module
module "nightscout" {
  source             = "./nightscout/"
  security_groups    = [module.security_groups.allow-https,] # Add "module.security_groups.allow-ssh" here if you'd like to be able to access the instance via SSH.
  subnet             = module.vpc.public_subnets.0
  launch_key         = module.launch_key_pair.key_pair_name
  private_launch_key = module.launch_key_pair.private_key_openssh

  # You can change this to any AMI of your choice. 
  # Defaults to the official Canonical Ubuntu 22.04 LTS amd64 server AMI
  ami = data.aws_ami.ubuntu-22_04-amd64.id

  domain   = var.my_nightscout_domain
  features = var.nightscout_features
  api_key  = var.nightscout_api_key
}