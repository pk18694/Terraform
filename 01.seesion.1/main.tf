resource "aws_instance" "my_ec2" {
  ami           = "ami-0cae6d6fe6048ca2c"   # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"

  key_name      = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyTerraformEC2"
  }
}

resource "aws_key_pair" "mykey" {
  key_name   = "Mac"
  public_key = file("/Users/prasannakumarreddy/Downloads/Mac.pem")   # path to your public key
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}