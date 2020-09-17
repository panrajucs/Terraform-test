provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    vpc="${var.vpc_id}"
}


resource "aws_instance" "web-1" {
    ami = "ami-04f280e88da88653a"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "AWS_KeyPair"
    subnet_id = "sg-0345b0dad2fcfb397"
    private_ip = "10.1.1.200"
    vpc_security_group_ids = "sg-0345b0dad2fcfb397"
    associate_public_ip_address = true	
    tags = {
        Name = "Docker-Master"
    }
} 

resource "aws_instance" "web-2" {
    ami = "ami-04ca8bd9d49a3a026"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "AWS_KeyPair"
    subnet_id = "sg-0345b0dad2fcfb397"
    vpc_security_group_ids = "sg-0345b0dad2fcfb397"
    associate_public_ip_address = true	
    tags = {
        Name = "Jenkins-Master"
    }
} 