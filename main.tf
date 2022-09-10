provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"

}

#Criação da Instancia EC2
resource "aws_instance" "dev" {
  #Looping para criar mais de uma instancia com o mesmo bloco#
   count = 3
   #Identificador de Imagem - pegamos isso na Propria AWS
   ami = "ami-052efd3df9dad4825"
   #Tipo de Instancia que sera criada - Tier VM
   instance_type = "t2.micro"
   #Chave de acesso para conexão no equipamento
   key_name = "terraformaws1"
   #Tag para Identificação do equipamento na AWS
   tags = {
    Name ="dev${count.index}"
   }
   #Security Group - Grupo VPC
   vpc_security_group_ids = ["sg-093e26b2601f05e8c"]
}

#Criação do Security Group Utilizado pelas EC2
resource "aws_security_group" "acesso_ssh" {
  name = "acesso-ssh-2"
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

