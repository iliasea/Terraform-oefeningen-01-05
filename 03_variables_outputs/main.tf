resource "local_file" "message" {
  filename = var.file_name
  content  = var.message
}
