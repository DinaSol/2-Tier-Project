variable "vpc" {}
data "aws_vpc" "vpc" {
  id = var.vpc
}
variable "subnets" {
  type = map
  default = {
        public-subnet = {
        "name" = "public-subnet"
        "availability_zone" = "eu-west-3a"
        "cidr_block" = "10.0.4.0/24"
    }
    private-subnet-1 = {
        "name" = "private-subnet-1"
        "availability_zone" = "eu-west-3a"
        "cidr_block" = "10.0.5.0/24"
    }
    private-subnet-2 = {
        "name" = "private-subnet-2"
        "availability_zone" = "eu-west-3b"
        "cidr_block" = "10.0.6.0/24"
    }
  }
}


############### WEB-module variables ############ 
#  variables assigned in web-module 
variable "web-ami" {default = "ami-06b6c7fea532f597e" }
variable "instance_type" {default = "t2.micro"}
variable "tag-name" {}
variable "web-sg-name" {
  default = "dina-security-group1"
}


############### RDS-module variables ############ 

variable "db-name" {}
variable "db-username" {}
variable "db-password" {}

