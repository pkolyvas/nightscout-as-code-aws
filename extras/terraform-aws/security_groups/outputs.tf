output "allow-https" {
  value = aws_security_group.allow-https.id
}

output "allow-ssh" {
  value = aws_security_group.allow-ssh
}