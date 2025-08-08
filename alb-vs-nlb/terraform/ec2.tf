locals {
  ami_id        = "ami-05df755b3db110c56"
  instance_type = "t3.micro"
}

resource "aws_instance" "http_server_a" {
  count                       = 2
  ami                         = local.ami_id
  instance_type               = local.instance_type
  subnet_id                   = element([aws_subnet.subnet_a.id, aws_subnet.subnet_b.id], count.index)
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "http-server-a-${count.index + 1}"
  }
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3-pip git
              cd /home/ec2-user
              git clone https://github.com/rafaritter44/devops.git
              cd devops/alb-vs-nlb/http-server/a
              pip3 install -r requirements.txt
              nohup flask run --host=0.0.0.0 &
              EOF
}

resource "aws_instance" "http_server_b" {
  ami                         = local.ami_id
  instance_type               = local.instance_type
  subnet_id                   = aws_subnet.subnet_a.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "http-server-b"
  }
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3-pip git
              cd /home/ec2-user
              git clone https://github.com/rafaritter44/devops.git
              cd devops/alb-vs-nlb/http-server/b
              pip3 install -r requirements.txt
              nohup flask run --host=0.0.0.0 &
              EOF
}

resource "aws_instance" "tcp_server" {
  count                       = 2
  ami                         = local.ami_id
  instance_type               = local.instance_type
  subnet_id                   = element([aws_subnet.subnet_a.id, aws_subnet.subnet_b.id], count.index)
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "tcp-server-${count.index + 1}"
  }
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y git
              cd /home/ec2-user
              git clone https://github.com/rafaritter44/devops.git
              cd devops/alb-vs-nlb/tcp-server
              nohup python3 app.py &
              EOF
}