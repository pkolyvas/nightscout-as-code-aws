variable "domain" {
  type = string
  description = "The domain name used for this instance of nightscout, and registered via AWS. This variable is required."
}

variable "instance_type" {
    type = string
    default = "t3.nano"
    description = "(Optional) The default instance type used for your installation of Nightscout. Defaults to t3.nano, the smallest instance."
}