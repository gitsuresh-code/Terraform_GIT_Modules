# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(
    var.vpc_tags,  #called from module variables 
    local.common_tags, #called from locals
    {
        Name = local.common_name_suffix
    }
  )

}

# IGW
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.igw_tags, #called from module variables
    local.common_tags, #called from locals
    {
        Name = local.common_name_suffix
    }
  )
}
