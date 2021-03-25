output "kubepublicip" {
  value = aws_instance.kube.*.public_ip
}
