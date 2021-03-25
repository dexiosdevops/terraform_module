resource "aws_key_pair" "mykey" {
  key_name   = "keyfile"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_security_group_rule" "apache" {
  from_port = 8080
  protocol = "TCP"
  security_group_id = data.aws_security_group.defaultgroup.id
  to_port = 8080
  type = "ingress"
  cidr_blocks     = ["0.0.0.0/0"]
}


resource "aws_instance" "kube" {
  count = length(var.instance_list)
  ami           = var.ubuntuami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name


  provisioner "file" {
    source      = "/home/ubuntu/test/install_Jenkins.sh"
    destination = "/tmp/install_Jenkins.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_Jenkins.sh",
      "sudo /tmp/install_Jenkins.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  tags = {
    Name = "Jenkins_server"
  }
}
