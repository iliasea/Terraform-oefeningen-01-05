variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API token ID (user@realm!tokenname)"
  type        = string
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "vm_node" {
  description = "Proxmox node to create the VM on"
  type        = string
}

variable "vm_template" {
  description = "Name of the template to clone"
  type        = string
}

variable "vm_name" {
  description = "Name of the new VM"
  type        = string
}
