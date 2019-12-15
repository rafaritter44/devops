provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux_2" {
    owners = [
        "amazon"
    ]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.*-arm64-gp2"]
    }
    most_recent = true
}

resource "aws_security_group" "web_sg" {
    name = "web_sg"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    tags = {
        Name = "web_sg"
    }
}

resource "aws_instance" "web" {
    ami = data.aws_ami.amazon_linux_2.id
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_sg.id]
    user_data = file("bootstrap.sh")
    tags = {
        Name = "web"
    }
    depends_on = [aws_security_group.web_sg]
}