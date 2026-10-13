output "created_file" {
  description = "The file Terraform created."
  value       = local_file.message.filename
}

output "file_content" {
  description = "The content of the file."
  value       = local_file.message.content
}
