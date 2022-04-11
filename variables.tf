
variable "PAT" {
  type = string
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Location of the provisioned resources"
}

variable "locationShort" {
  type        = string
  default     = "euw"
  description = "3 Letter short location"

}