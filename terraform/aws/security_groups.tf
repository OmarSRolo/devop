resource "aws_security_group" "allow_ssh" {
  name   = "Allow ssh"
  vpc_id = var.vpc_id
  ingress {
    description = "Shh port in the vps"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "allow_ssh"
  }
}

