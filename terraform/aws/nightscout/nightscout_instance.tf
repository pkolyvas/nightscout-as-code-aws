resource "aws_instance" "nightscout-central" {
  ami                         = var.ami
  associate_public_ip_address = false
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
  user_data = data.local_file.nightscout-configure.content
}

data "local_file" "nightscout-configure" {
  filename = "nightscout/nightscout-bootstrap.sh"
}