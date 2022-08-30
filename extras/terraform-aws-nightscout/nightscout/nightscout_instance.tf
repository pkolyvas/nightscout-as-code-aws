resource "aws_instance" "nightscout-central" {
  ami                         = var.ami
  associate_public_ip_address = false
  availability_zone           = "ca-central-1a"
  instance_type               = var.instance_type
  monitoring                  = false
  key_name                    = var.key
  source_dest_check           = true
  disable_api_termination     = true
  tags = {
    "Application"     = "Nightscout"
    "Name"            = "Nightscout and Mongo"
    "Status"          = "Terraformed"
  }
  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }
}

resource "aws_ebs_volume" "nightscout-central-data" {
  availability_zone = "ca-central-1a"
  size              = 16
  tags = {
    Name = "Nightscout central data volume"
  }
}

resource "aws_volume_attachment" "nightscout-central-data" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.nightscout-central-data.id
  instance_id = aws_instance.nightscout-central.id
}

resource "aws_ebs_volume" "nightscout-central-var" {
  availability_zone = "ca-central-1a"
  size              = 8
  tags = {
    Name = "Nightscout central var volume"
  }
}

resource "aws_volume_attachment" "nightscout-central-var" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.nightscout-central-var.id
  instance_id = aws_instance.nightscout-central.id
}

resource "aws_route53_record" "nightscout-central-private" {
  zone_id = var.private_domain_zone
  name    = "nightscout-central.shiftfocus.ca"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.nightscout-central.private_ip]
}