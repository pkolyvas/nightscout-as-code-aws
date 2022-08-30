resource "aws_instance" "nightscout-central" {
  ami                         = var.ami
  associate_public_ip_address = false
  availability_zone           = 
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
  
  vpc_security_group_ids = 
  subnet_id              = module.vpc.public_subnets.0
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }
   user_data = <<EOF
#!/bin/bash
echo "Configuring the instance environment"
set NS-API-KEY="${var.nightscout_api_key}"
set NS-DOMAIN="${var.domain}"
echo "Updating the system and installing Docker CE"
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce

EOF
}