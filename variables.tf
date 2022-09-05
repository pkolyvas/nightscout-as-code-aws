variable "my_nightscout_domain" {
  type        = string
  description = "(Required) The AWS-managed domain name used for your Nightscout instance"
}

variable "nightscout_api_key" {
  type        = string
  sensitive   = true
  description = "(Required) Please set an API key, aka password, to access your Nightscout instance. Please strongly consider making this hard to guess, but easy to remember. https://xkcd.com/936/"
}
variable "nightscout_features" {
  type        = string
  description = "(Required) A space-separated list of features you'd like to enable in Nightscout. Defaults are normally \"careportal rawbg iob\". Please refer to the Nightscout documentation if you're unsure: https://nightscout.github.io/nightscout/setup_variables/#features"
}

variable "aws_access_key" {
  type = string
  sensitive = true
  description = "Your AWS access key ID."
}

variable "aws_secret_key" {
  type = string
  sensitive = true
  description = "Your AWS secret access key."
}

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
variable "aws_region" {
  type = string
  default = "us-east-2"
  description = "The AWS region where you would like to run your Nightscout to run."
}
