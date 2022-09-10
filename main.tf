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
   vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraformaws1"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraformaws1"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  
}


resource "aws_s3_bucket" "dev4" {
  bucket = "buckets3tform"
  acl = "private"

  tags = {
    "name" = "bucket-lab"
  }
  
}

