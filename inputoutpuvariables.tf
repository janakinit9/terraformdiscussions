provider "aws" {
  region = "eu-west-1"
  profile = "janaki"
}

//this is a string variable

variable "firststring" {
  type = "string"
  default = "this is my first string"
}

variable "multilinestring" {
  type = "string"
  default = <<EOH
	this is a multiline
	string
	newline
	EOH
}

output "myfirstoutput" {
  value = "${var.firststring}"
}

output "mymultilineoutput" {
  value = "${var.multilinestring}"
}


//This is my maps example

variable "mapexample" {
  type = "map"
  default = {
    "useast" = "ami1"
    "euwest" = "ami2"
  }
}

output "mapoutput" {
  value = "${var.mapexample["euwest"]}"
}

//this is array/lists

variable "mysecuritygrouplist" {
  type = "list"
  default = ["sg1", "sg2", "sg3"]
}

output "sgoutput" {
  value = "${var.mysecuritygrouplist}"
}

variable "testbool" {
  default = false
}

output "booloutput"{
  value = "${var.testbool}"
}

variable "myInputVariable" {
  type = "string"
}
// if we r using a sensitive variable like password to output and u dont want tusr to see then use sensitive
output "myOutputVariable" {
  sensitive = true
  value = "${var.myInputVariable}"
}