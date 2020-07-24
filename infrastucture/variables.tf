variable "prefix" {
  description = "The prefix which should be used for all resources"
  default     = "blog"
}

variable "location" {
  description = "The Azure Region in which all resources will be created."
  default     = "West US"
}

variable "username" {
  description = "The default username"
  default     = "emeraldtheadmin"
}
