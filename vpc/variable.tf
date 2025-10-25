variable "vpc_cidr" {
    type = string  # this mandatory filed which user need to enter
}

variable "project_name" {
    type = string
    default = "roboshop"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "vpc_tags" {
  type = map
  default = {} # this is emplty declaration and optional for user input
}

variable "igw_tags" {
    type = map
    description = "this is the main enterance for VPC for ingress and egress"
    default = {} # this is emplty declaration and optional for user input
  }

#PUBLIC SUBNET cidr and tags
variable "public_subnet_cidrs" {
    type = list  # this mandatory filed which user need to enter
}

variable "public_subnet_tags" {
    type = map
    default = {}
}


