output "security_group_ids" {
  value = {
    allow_http = aws_security_group.allow_http.id
    allow_https = aws_security_group.allow_https.id
    allow_ssh = aws_security_group.allow_ssh.id
    allow_pg = aws_security_group.allow_pg.id
    allow_amqp = aws_security_group.allow_amqp.id
  }
}