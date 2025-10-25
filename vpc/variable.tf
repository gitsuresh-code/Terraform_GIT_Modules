variable "vpc_cidr" {
    type = string
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
  default = {}
}


