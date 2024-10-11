
//autoScalling Group
resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"
  image_id     = "ami-0c55b159cbfafe1f0"  // Replace with your AMI
  instance_type = "t2.micro"
  security_groups = [aws_security_group.app_sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 2
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  launch_configuration = aws_launch_configuration.app.id

  tag {
    key                 = "Name"
    value               = "app-instance"
    propagate_at_launch = true
  }
}

