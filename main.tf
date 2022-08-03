#By using count
resource "aws_instance" "web" {
  count         =length(var.shaik_name)
  ami           = var.ami[count.index]
  instance_type = "t2.micro"
  
tags ={
    name = var.shaik_name[count.index],
    owner="shaikMasthan"
  }
}

#By using count create VPC 
resource "aws_vpc" "main" {
  
  cidr_block       = "10.0.0.0/24"
  count=length(var.shaik_name)
  instance_tenancy = "default"

  tags = {
    Name = var.shaik_name[count.index],
    owner="shaik"
  }
}



#By using for_each Create different tags names&owner
resource "aws_instance" "test_instance" {
  for_each = var.shaik_loop
  ami      = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  
tags ={
    name =each.value,
    owner=each.key
  }
}

# By using for_each create dynamic instance
resource "aws_instance" "test_instance2" {
  
  for_each       = var.shaik_loop2
  ami            = each.value.ami
  instance_type  = each.value.ins_type

tags ={
    name =each.value.name,
    owner=each.key
  }
}

#By using for each create vpc
resource "aws_vpc" "main2" {
  cidr_block       = "10.0.0.0/24"
  for_each = toset(var.shaik)
  instance_tenancy = "default"

  tags = {
    name =each.value,
    owner=each.key
  }
}



  


