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


