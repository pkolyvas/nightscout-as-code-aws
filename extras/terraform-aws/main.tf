# Choose a region for your deployment
# The Default Region is for the East Coast of the US
#
# Other options:
# Asia Pacific = "ap-south-1"
# Canada = "ca-central-1"
# Europe = "eu-central-1"
# US West = "us-west-2"
#
# Please note costs will differ depending on the regions you choose and these configurations
# have not been tested outside of North American regions
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = "nightscout-vpc"
  cidr = "10.223.0.0/16"

  # If you changed the region above you'll need to change these availability zones (AZs)
  # to match. You can get by using the "a" and "b" availability zones without too much worry.
  azs             = ["us-east-2a", "us-east-2b"]

  private_subnets = ["10.223.1.0/24", "10.223.2.0/24"]
  public_subnets  = ["10.223.3.0/24", "10.223.4.0/24"]

  enable_nat_gateway = false
}

module "nightscout" {
  source = "./nightscout/"
  domain = var.my_nightscout_domain
  features = var.nightscout_features
  api_key = var.nightscout_api_key
}