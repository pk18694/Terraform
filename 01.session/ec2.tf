resource "aws_instance" "web" {
  ami           = "ami-0cbbe2c6a1bb2ad63"
  instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.roboshop-all.id]
  tags = {
    Name = "Hellopk"
  }
}

resource "aws_security_group" "roboshop-all" { 
    name   = var.sg-name
    description = var.sg-description
    #vpc_id     +aws_vpc.main.id = connection 

      ingress {
        description  = "allow all ports"
    from_port        = var.inbound-from-port
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    #ipv6_cidr_blocks = ["::/0"]
      }

      egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
    }
}
