# Source for the VPC Module:
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/3.14.2
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "nightscout-vpc"
  cidr = "10.223.0.0/16"

  # If you changed the region above you'll need to change these availability zones (AZs)
  # to match. You can get by using the "a" and "b" availability zones without too much worry.
  azs = ["${var.aws_region}a"]

  public_subnets  = ["10.223.3.0/24"]

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

# Security groups we can add/remove from our Nightscout instance
# Currently only HTTPS & SSH
module "security_groups" {
  source = "./security_groups/"
  vpc_id = module.vpc.vpc_id
}

# This is our Nightscount Module
module "nightscout" {
  source             = "./nightscout/"
  security_groups    = [module.security_groups.allow-https, module.security_groups.allow-ssh]
  subnet             = module.vpc.public_subnets.0
  launch_key         = module.launch_key_pair.key_pair_name
  private_launch_key = module.launch_key_pair.private_key_openssh

  # AWS Configuration values for Nightscout bootstraping/provisioning
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region

  # You can change this to any AMI of your choice. 
  # Defaults to the official Canonical Ubuntu 22.04 LTS amd64 server AMI
  ami           = var.alternative_ami == "" ? data.aws_ami.ubuntu-22_04-amd64.id : var.alternative_ami
  instance_type = var.aws_ec2_instance_type

  # These are all the values we're going to collect to configure Nightscout
  # The need to be defined in the root module variable definitions and 
  # passed into this Nightscout module. Additionally you'll need to have the
  # user_data (cloudinit) script convert these into environment variables we can use
  # to configure nightscout via the Docker Compose file
  domain   = var.my_nightscout_domain
  features = var.nightscout_features
  api_key  = var.nightscout_api_key
  storage  = var.storage

  # Additional configuration options
  nightscout_image     = var.nightscout_image
  nightscout_image_tag = var.nightscout_image_tag
  mongo_image          = var.mongo_image
  mongo_image_tag      = var.mongo_image_tag
}