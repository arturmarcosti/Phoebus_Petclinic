provider aws {
    region = "us-east-1"
    profile = "petclinic"

}

terraform{
    backend "s3" {
        region = "us-east-1"
        bucket = "petclinicbackend"
        key = "terraform.tfstate"
        profile = "petclinic"
    }
}

resource "aws_instance" "web"{
    ami = "data.aws_ami.ubuntu.id"
    instance_type = "t2.micro"

    tags = {
        Name = "PetClinic"
        type = "master"
  }
}

resource "aws_key_pair" "petclinic" {
    profile = "petclinic"

}

## os Cidr_blocks estão para aceitar qualquer tipo de conexão apenas por se tratar de ambiente de homologação.
resource "aws_security_group" "petclinic" {

    dynamic "ingress" {
        for_each = var.default_ingress
        content {
            description = ingress.voluel["description"]
            from_port = ingress.key
            to_port = ingress.key
            protocol = "tcp"
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }

}
