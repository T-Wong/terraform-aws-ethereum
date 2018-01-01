# Required Variables
variable "name" {
  description = "The name to use for the resources in this module."
}

variable "spotfleet_id" {
  description = "The Spot Fleet request ID to create alarms for."
}

variable "email" {
  description = "Email to send alarm notifications to."
}
