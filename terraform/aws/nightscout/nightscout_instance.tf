resource "aws_instance" "nightscout-central" {
  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  monitoring                  = false
  key_name                    = var.launch_key
  source_dest_check           = true
  disable_api_termination     = true
  tags = {
    "Application" = "Nightscout"
    "Name"        = "Nightscout and Mongo"
    "Status"      = "Terraformed"
  }

  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  user_data = templatefile("nightscout/nightscout-bootstrap.sh", {
    api_key  = var.api_key
    domain   = var.domain
    features = var.features
  })

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_launch_key
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "nightscout/docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  provisioner "file" {
    source      = "nightscout/nightscout-start.sh"
    destination = "/home/ubuntu/nightscout-start.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /home/ubuntu/nightscout-start.sh",
      "/home/ubuntu/nightscout-start.sh"
    ]
  }
}