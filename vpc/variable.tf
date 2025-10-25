variable "vpc_cidr" {
    type = string  # MANDATORY
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
    type = list  # MANDATORY
}

variable "public_subnet_tags" {
    type = map
    default = {} # this is emplty declaration and optional for user input
}

#PRIVATE SUBNET cidr and tags
variable "private_subnet_cidrs" {
    type = list #MANDATORY

}

variable "private_subnet_tags" {
    type = map
  default = {} # this is emplty declaration and optional for user input
}

#DATABASE SUBNET cidr and tags
variable "database_subnet_cidrs" {
    type=list
}

variable "database_subnet_tags" {
    type = map
  default = {} # this is emplty declaration and optional for user input
}

#ROUTE TABLE tags
variable "public_route_table_tags" {
  type = map
  default = {} # this is emplty declaration and optional for user input
}

variable "private_route_table_tags" {
  type = map
  default = {} # this is emplty declaration and optional for user input
}

variable "database_route_table_tags" {
  type = map
  default = {} # this is emplty declaration and optional for user input
}


#Elastic IP
variable "eip_tags" {
    type=map 
    default={}  # this is emplty declaration and optional for user input
}


#NAT tags
variable "nat_gateway_tags" {
    type = map
    default = {} # this is emplty declaration and optional for user input
}
