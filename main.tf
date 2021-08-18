provider "aws" {
    region = "us-east-1e"
    
}

resource "aws_instance" "web"{
    ami = "data.aws_ami.ubuntu.id"
    instance_type = "t2.micro"
    
    tags = {
        Name = "PetClinic"
  }
}

resource "aws_key_pair" "petclinic" {
    key_name = "petclinic"
  
}

## os Cidr_blocks estão para aceitar qualquer tipo de conexão apenas por se tratar de ambiente de homologação.
resource "aws_security_group" "petclinic" {
   ingress = {
     from_port = 0
     protocol = "-1"
     self = true
     to_port = 0
   }
}
resource "aws_security_group" "petclinic" {
    ingress = {
     cidr_blocks = [ "0.0.0.0/0" ]
     from_port = 22
     protocol = "tcp"
     to_port = 22
   }
}

resource "aws_security_group" "petclinic" {
   ingress = {
     cidr_blocks = [ "0.0.0.0/0" ]
     from_port = 8080
     protocol = "tcp"
     to_port = 8080
   }
}

resource "aws_security_group" "petclinic" {
   egregress = {
     cidr_blocks = [ "0.0.0.0/0" ]
     from_port = 0
     protocol = "-1"
     to_port = 0
   }
}
