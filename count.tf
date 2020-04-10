provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "testinatance" {
  ami = "ami-06fcc1f0bc2c8943f"
  instance_type = "t2.micro"
  count = 3
  tags ={
    Name = "testmachine -${count.index}"
  }


}