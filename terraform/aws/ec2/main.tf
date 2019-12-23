provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux_2" {
    owners = [
        "amazon"
    ]
    filter {
        name = "name"
        values = [
            "amzn2-ami-hvm-2.0.*-x86_64-gp2"
        ]
    }
    most_recent = true
}

resource "aws_security_group" "web_sg" {
    name = "web_sg"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    tags = {
        Name = "web_sg"
    }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [
        aws_security_group.web_sg.id
    ]
    key_name = aws_key_pair.deployer.key_name
    user_data = file("bootstrap.sh")
    tags = {
        Name = "web"
    }
    depends_on = [
        aws_security_group.web_sg,
        aws_key_pair.deployer
    ]
}