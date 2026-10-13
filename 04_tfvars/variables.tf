variable "environment" {
  description = "Name of the environment."
  type        = string
}

variable "file_name" {
  description = "Name of the file Terraform creates."
  type        = string
}

variable "message" {
  description = "Description of the environment."
  type        = string
}

variable "replica_count" {
  description = "Number of replicas for this environment."
  type        = number
}

variable "enable_monitoring" {
  description = "Whether monitoring is enabled."
  type        = bool
}

