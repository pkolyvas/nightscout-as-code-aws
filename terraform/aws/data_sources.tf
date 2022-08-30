# This data source uses Canonical's account ID to retreive the most up-to-date Ubuntu 22.04 LTS AMI
# for use in the nightscout EC2 instance.
# You can confirm this to be true here: https://ubuntu.com/server/docs/cloud-images/amazon-ec2

data "aws_ami" "ubuntu-22_04-amd64" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}