provider "aws" {
  region = "us-east-1"
}

resource "aws_launch_template" "my_lt" {
    image_id = "ami-035240afa793cddbb"
    instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "my_asg" {
    availability_zones = [
        "us-east-1a",
        "us-east-1b",
        "us-east-1c"
    ]
    min_size = 3
    max_size = 3
    desired_capacity = 3
    launch_template {
        id = aws_launch_template.my_lt.id
        version = "$Latest"
    }
}