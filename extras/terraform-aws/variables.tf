variable "my_nightscout_domain" {
  type = string
  description = "(Required) The AWS-managed domain name used for your Nightscout instance"
}

variable "nightscout_api_key" {
    type = string
    description = "(Required) Please set an API key, aka password, to access your Nightscout instance. Please strongly consider making this hard to guess, but easy to remember. https://xkcd.com/936/"
}
variable "nightscout_features" {
    type = string
    default = "careportal rawbg iob"
    description = "(Optional) A space-separated list of features you'd like to enable in Nightscout. Defaults to \"careportal rawbg iob\"."
}

