variable "file_name" {
  description = "Name of the local file Terraform creates."
  type        = string
  default     = "message.txt"
}

variable "message" {
  description = "Content written to the file."
  type        = string
  default     = "Terraform can use variables."
}
