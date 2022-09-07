# The Nightscout instance
# Here we configure the EC2 instance with the necessary software.
# We install Docker Container Engine, Docker Compose, and the AWS CLI tooling
# Then we configure the persistent storage to keep our users' BG data safe between upgrades
# We also enable a snapshot of the data before the instance is modified.
resource "aws_instance" "nightscout" {
  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  monitoring                  = false
  key_name                    = var.launch_key
  source_dest_check           = true
  disable_api_termination     = true
  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    "Application" = "Nightscout"
    "Name"        = "Nightscout"
    "Status"      = "Terraformed"
  }

  vpc_security_group_ids = var.security_groups
  subnet_id              = var.subnet
  lifecycle {
    ignore_changes = [
      ami,
    ]
    create_before_destroy = false
  }

  # We use the user_data and a template file to configure all the variables for nightscout
  # That way we can replace the instance on an upgrade or when values change
  # We won't loose the data however because of the ebs volume we add later on in the process
  user_data_replace_on_change = true
  user_data = templatefile("nightscout/nightscout-userdata.sh", {
    api_key    = var.api_key
    domain     = var.domain
    features   = var.features
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region
  })

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_launch_key
    host        = self.public_ip
  }

  # Installing Docker CE, Docker Compose and AWS CLI
  provisioner "remote-exec" {
    script = "nightscout/bootstrap.sh"
  }

  # Uploading Docker Compose file
  provisioner "file" {
    source      = "nightscout/docker-compose.yml"
    destination = "/home/ubuntu/docker-compose.yml"
  }

  # Docker configuration and check
  provisioner "remote-exec" {
    script = "nightscout/docker-setup.sh"
  }
}

# Creating a resource to handle persistent storage of nightscout data
resource "aws_ebs_volume" "nightscout-data" {
  availability_zone = "${var.region}a"
  size              = var.storage
  tags = {
    Name = "Nightscout data"
  }
}

resource "aws_volume_attachment" "nightscout-data" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.nightscout-data.id
  instance_id = aws_instance.nightscout.id
}

resource "aws_ebs_snapshot" "nightscout-backup" {
  volume_id = aws_ebs_volume.nightscout-data.id

  tags = {
    Name = "Nightscout data snapshot"
    Date = formatdate("YYYY-MM-DD", timestamp())
  }
}

resource "null_resource" "configure_nightscout_storage" {
  depends_on = [
    aws_volume_attachment.nightscout-data
  ]

  # # Trigger an update if we modify this on a future upgrade
  # triggers = {
  #   filesha = filesha1("nightscout/configure-nightscout-storage.sh")
  # }

  lifecycle {
    replace_triggered_by = [
      aws_volume_attachment.nightscout-data
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_launch_key
    host        = aws_instance.nightscout.public_ip
  }
  provisioner "remote-exec" {
    script = "nightscout/configure-nightscout-storage.sh"
  }
}


resource "null_resource" "start_nightscout" {
  depends_on = [
    null_resource.configure_nightscout_storage
  ]

   triggers = {
    filesha = filesha1("nightscout/configure-nightscout-storage.sh")
    filesha = filesha1("nightscout/start-nightscout.sh")
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = var.private_launch_key
    host        = aws_instance.nightscout.public_ip
  }
  provisioner "remote-exec" {
    script = "nightscout/start-nightscout.sh"
  }
}