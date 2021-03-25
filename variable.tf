variable "accesskey" {
}

variable "seckey" {
}

variable "region" {
  default = "ap-southeast-1"
}
variable "instance_list" {
  type = list(string)
}

variable "ubuntuami" {
  default = "ami-0ba0ce0c11eb723a1"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "keyfile.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "keyfile"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
