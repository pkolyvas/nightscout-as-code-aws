variable "my_nightscout_domain" {
  type = string
  description = "The AWS-managed domain name used for your Nightscout instance"
}

variable "nightscout_features" {
    type = string
    default = "careportal rawbg iob"
    description = "A space-separated list of features to enable in Nightscout. Defaults to \"careportal rawbg iob\"."
}

variable "nightscout_api_key" {
    type = string
    description = "The API key, aka password, to access your nightscout instance. Please strongly consider making this hard to guess, but easy to remember. https://xkcd.com/936/"
}