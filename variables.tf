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
  type        = string
  sensitive   = true
  description = "Your AWS access key ID."
}

variable "aws_secret_key" {
  type        = string
  sensitive   = true
  description = "Your AWS secret access key."
}

####################
# Nightscout options
####################

variable "disable" {
  type        = string
  default     = ""
  description = "Used to disable default features, expects a space delimited list."
}

variable "base_url" {
  type        = string
  default     = ""
  description = "Used for building links to your site's API, i.e. Pushover callbacks, usually the URL of your Nightscout site."
}

variable "auth_default_roles" {
  type        = string
  default     = ""
  description = "Possible values `readable`, `denied`, or any valid role name. When readable, anyone can view Nightscout without a token. Setting it to `denied` will require a token from every visit, using status-only will enable api-secret based login."
}

variable "import_config" {
  type        = string
  default     = ""
  description = "Used to import settings and extended settings from a url such as a gist."
}

variable "treatments_auth" {
  type        = string
  default     = ""
  description = "Possible values on or off. Deprecated, if set to off the careportal role will be added to AUTH_DEFAULT_ROLES."
}

variable "alarm_types" {
  type        = string
  default     = ""
  description = "simple and/or predict."
}

variable "bg_high" {
  type        = string
  default     = ""
  description = "Urgent High BG threshold, triggers the ALARM_URGENT_HIGH alarm."
}

variable "bg_low" {
  type        = string
  default     = ""
  description = "Urgent Low BG threshold, triggers the ALARM_URGENT_LOW alarm."
}

variable "bg_target_bottom" {
  type        = string
  default     = ""
  description = "Low BG threshold, triggers the ALARM_LOW alarm."
}

variable "bg_target_top" {
  type        = string
  default     = ""
  description = "High BG threshold, triggers the ALARM_HIGH alarm."
}

variable "alarm_urgent_high" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the Urgent High alarm (triggered when BG crosses BG_HIGH). (on or off)."
}

variable "alarm_high" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the High alarm (triggered when BG crosses BG_TARGET_TOP). (on or off)"
}

variable "alarm_low" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the Low alarm (triggered when BG crosses BG_TARGET_BOTTOM). (on or off)"
}

variable "alarm_urgent_low" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the Urgent Low alarm (triggered when BG crosses BG_LOW). (on or off)"
}

variable "alarm_timeago_urgent" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for an urgent alarm when CGM data hasn't been received in the number of minutes set in ALARM_TIMEAGO_URGENT_MINS. on or off)"
}

variable "alarm_timeago_urgent_mins" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an ALARM_TIMEAGO_URGENT alarm."
}

variable "alarm_timeago_warn" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for a warning alarm when CGM data hasn't been received in the number of minutes set in ALARM_TIMEAGO_WARN_MINS. (on or off)"
}

variable "alarm_timeago_warn_mins" {
  type        = string
  default     = ""
  description = "Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an ALARM_TIMEAGO_WARN alarm."
}

###########################################
# Additional configuration option variables
###########################################
variable "nightscout_image" {
  type        = string
  default     = "nightscout/cgm-remote-monitor"
  description = "The Docker image used for Nightscout. Offers the opportunity to customize which image is being run. Defaults to the official Nightscout image."
}

variable "nightscout_image_tag" {
  type        = string
  default     = "latest"
  description = "The tag used to specify which image version of nightscout is being run. Defaults to latest."
}

variable "mongo_image" {
  type        = string
  default     = "mongo"
  description = "The Docker image used for Mongo. Offers the opportunity to customize which mongo docker image is being run. Defaults to the offical mongo docker image."
}

variable "mongo_image_tag" {
  type        = string
  default     = "4.4"
  description = "The tag used to specify which image version of mongo is being run. Defaults to 4.4."
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
  type        = string
  default     = "us-east-2"
  description = "The AWS region where you would like to run your Nightscout to run."
}

variable "storage" {
  type        = number
  default     = 8
  description = "The amount of storage for your Nightscout data, in GB."
}
