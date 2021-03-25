data "aws_security_group" "defaultgroup" {
  filter {
    name   = "group-name"
    values = ["*default*"]
  }
}
