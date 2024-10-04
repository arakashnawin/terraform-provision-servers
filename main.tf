# ------------------------------------------------------------------- #
# Use this project to provision EC2 servers
# Map variable defines the details of each server you are provisioning
#    Name/Tag of the server = Type of the server
# AUTHOR: AKASH NAWIN | +91-9916818558 
# ------------------------------------------------------------------- #

provider "aws" {
  region = "ap-south-1"
}

variable "myhosts" {
  type = map
  default = {
    K8sMaster = "t2.medium"
    K8sWorker1 = "t2.micro"
    K8sWorker2 = "t2.micro"
  }
}

variable "mykey" { 
  default = "JanFeb24"
}

module "server" {
  for_each = var.myhosts
  servername = each.key
  type = each.value  
  pemfile = var.mykey
  source = "./modules/instances"
}

