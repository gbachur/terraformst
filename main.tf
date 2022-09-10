provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"

}

resource "aws_instance" "dev" {
   count = 3
   ami = "ami-052efd3df9dad4825"
   instance_type = "t2.micro"
   key_name = "terraformaws1"
   tags = {
    Name ="dev${count.index}"
   }
}

resource "aws_security_group" "acesso_ssh" {
  name = "acesso-ssh"
  description = "Permitir acesso SSH nas instancias EC2 - Security Group"

  ingress {
    
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["179.125.55.100/32"]

    
  } 

  tags ={
    Name = "Allow-SSH"
  }

}

