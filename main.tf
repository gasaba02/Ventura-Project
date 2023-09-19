
resource "aws_vpc" "prod_vpc" {
  cidr_block       = var.vpc_cidar
  instance_tenancy = "default"

  tags = {
    Name = "Prod_VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = 2
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = element(var.pub_subnet_cidar, count.index)
  availability_zone = element(var.pub_availability_zone, count.index)

  tags = {
    Name = element(var.pub_subnet_names, count.index)
  }

}

resource "aws_subnet" "private_subnet" {
    count = 6
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = element(var.priv_subnet_cidar, count.index)
    availability_zone = element(var.pub_availability_zone, count.index % length(var.pub_availability_zone))

    tags = {
      Name = element(var.priv_sunbet_names, count.index)
    }

}

resource "aws_internet_gateway" "prod_IGW" {
    vpc_id = aws_vpc.prod_vpc.id

  
}

resource "aws_route_table" "prod_RT" {
    vpc_id = aws_vpc.prod_vpc.id

    # route {
    #     cidr_block = "10.0.1.0/28"
    #     gateway_id = aws_internet_gateway.prod_IGW.id
    # }

    # route {
    #     cidr_block = "10.0.3.0/28"
    #     gateway_id = aws_internet_gateway.prod_IGW.id
    # }

    # route {
    #     cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_internet_gateway.prod_IGW
    # }
  
}

resource "aws_route" "default-route" {
    route_table_id = aws_route_table.prod_RT.id
    gateway_id = aws_internet_gateway.prod_IGW.id
    destination_cidr_block = "0.0.0.0/0"

  
}

locals {
  subnet_names_to_id = {
    subnet-1 = aws_subnet.public_subnet[0].id
    subnet-2 = aws_subnet.public_subnet[1].id
  }
}

resource "aws_route_table_association" "prod_rt_ass0ciation" {
    for_each = local.subnet_names_to_id

    subnet_id = each.value
    route_table_id = aws_route_table.prod_RT.id
  
}




