
//Bastion Host
resource "aws_instance" "bastion" {
  ami           = "ami-0c55b159cbfafe1f0"  // Replace with your AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = var.key_name
  security_groups = [aws_security_group.lb_sg.id]
  
  tags = {
    Name = "bastion-host"
  }
}
