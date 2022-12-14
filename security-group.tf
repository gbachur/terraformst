#Criação do Security Group Utilizado pelas EC2
resource "aws_security_group" "acesso_ssh" {
  name        = "acesso-ssh-2"
  description = "Permitir acesso SSH nas instancias EC2 - Security Group"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["179.125.55.100/32"]


  }

  tags = {
    Name = "Allow-SSH"
  }

}

resource "aws_security_group" "acesso_ssh-us-east-2" {
  provider    = "aws.us-east-2"
  name        = "acesso-ssh-2"
  description = "Permitir acesso SSH nas instancias EC2 - Security Group - us-east-2"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["179.125.55.100/32"]


  }

  tags = {
    Name = "Allow-SSH"
  }
}