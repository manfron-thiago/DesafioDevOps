# Adicionar Page HTML
locals {
  html_file = var.html_file
}

resource "null_resource" "copy_html_file" {
  provisioner "remote-exec" {
    inline = [
      "echo '${local.html_file}' > /var/www/html/index.html",
      "sudo chown root:root /var/www/html/index.html",
    ]

    connection {
      type        = "ssh"
      host        = aws_instance.web.public_ip
      user        = var.instance_username
      private_key = file(var.private_key_path)