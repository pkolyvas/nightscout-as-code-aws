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
# have not been tested outside of North American regions.
#
# Additionally if you change this value, please review the availbility zone values in the vpc module.
provider "aws" {
  region = "us-east-2"
}