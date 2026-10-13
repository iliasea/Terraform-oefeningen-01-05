output "environment" {
  value = var.environment
}

output "created_file" {
  value = local_file.config.filename
}

output "replica_count" {
  value = var.replica_count
}
