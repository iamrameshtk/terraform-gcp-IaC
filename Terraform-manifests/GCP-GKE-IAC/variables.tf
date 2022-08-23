variable "location" {
  description   = "Google cloud Region on which all resources should be created"
  type          = string
}

variable "project_name" {
    description = "Name of the Google cloud project"
    type        = string
  
}
variable "project_number" {
    description = "Unique Number of the Google cloud project"
    type        = number
    default     = 190541024977
  
}
variable "fw-ports" {
  description = "Enable ports"
  type = list
  default = [
    "22",
    "80",
    "443",
    "8443"
  ]
}