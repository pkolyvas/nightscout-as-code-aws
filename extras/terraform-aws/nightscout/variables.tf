variable "domain" {
  type = string
  description = "The domain name used for this instance of nightscout, and registered via AWS"
}

variable "instance_type" {
    type = string
    default = "t3.nano"
    description = "The default instance type used for your installation of Nightscout. Defaults to t3.nano, the smallest instance."
}