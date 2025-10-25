# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(
    var.vpc_tags,  #called from module variables 
    local.common_tags, #called from locals
    {
        Name = "${local.common_name_suffix}-vpc" #resource name: roboshop-dev-vpc
    }
  )

}

# IGW -- this run after VPC is created
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id #takes vpc id from above

  tags = merge(
    var.igw_tags, #called from module variables
    local.common_tags, #called from locals
    {
        Name = "${local.common_name_suffix}-igw" # resource name: roboshop-dev-igw
    }
  )
}


# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.public_subnet_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-public-${local.az_names[count.index]}" # roboshop-dev-public-us-east-1a
    }
  )
}

# Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.private_subnet_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-private-${local.az_names[count.index]}" # roboshop-dev-private-us-east-1a
    }
  )
}
