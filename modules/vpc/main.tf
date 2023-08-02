resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    instance_tenancy = "default"
    enable_dns_hostnames = true

    assign_generated_ipv6_cidr_block = true

    tags = {
        Name = "${var.project}-${var.environment}-vpc"
    }
}

data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet
    map_public_ip_on_launch = true

    ipv6_cidr_block = "${cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, 1)}"
    assign_ipv6_address_on_creation = true

    tags = {
        Name = "${var.project}-${var.environment}-dual-stack"
    }
}

resource "aws_subnet" "public_subnet_az1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.public_subnet_2
    availability_zone       = data.aws_availability_zones.available_zones.names[0]  //this is indexing
    //resources launched with this will have a public ip address
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project}-${var.environment}-public-az1"
    }
}
  

