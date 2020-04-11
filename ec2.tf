resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

}
resource "aws_subnet" "mysubnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.myvpc.id}"
}
resource "aws_route_table" "myroutetable" {
  vpc_id = "${aws_vpc.myvpc.id}"
}
resource "aws_route_table_association" "myrouteassociation" {
  route_table_id = "${aws_route_table.myroutetable.id}"
  subnet_id = "${aws_subnet.mysubnet.id}"
}
resource "aws_internet_gateway" "mygateway" {
  vpc_id = "${aws_vpc.myvpc.id}"
}
resource "aws_route" "myroute" {
  route_table_id = "${aws_route_table.myroutetable.id}"
  gateway_id = "${aws_internet_gateway.mygateway.id}"
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_security_group" "mysecuritygroup" {
  vpc_id = "${aws_vpc.myvpc.id}"
  name = "mysecgrp"
  description = "created from terraform"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "myinstance" {
  ami = "ami-06fcc1f0bc2c8943f"

  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.mysubnet.id}"
  key_name = "new"
  vpc_security_group_ids = ["${aws_security_group.mysecuritygroup.id}"]
}
//vpc,subnet , amiid,instancetype,security group
//vpc -> route table , route asociations , routes..key pair....
