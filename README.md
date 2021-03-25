# terraform_module

module "jenkinsinstall" {
  source= "git@github.com:dexiosdevops/terraform_module.git"
  accesskey= var.aws_access ### pass your accesskey ex : "XCSFGH"
  seckey= var.aws_sec ### pass your Sec key ex: "45tghuytdx"
  region = var.aws_region ### pass value of region ex : "us-east-1"
  instance_list= var.inst_list ### give the list of the instances  ex: "["calss","ubuntu"]"
  }
