locals {
  summary = <<-EOT
    Environment:       ${var.environment}
    Message:           ${var.message}
    Replica count:     ${var.replica_count}
    Monitoring:        ${var.enable_monitoring}
  EOT
}

resource "local_file" "config" {
  filename = var.file_name
  content  = local.summary
}
