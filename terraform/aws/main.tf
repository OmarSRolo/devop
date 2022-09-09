variable "ssh_key_path" {}
variable "vpc_id" {}
variable "instance_type" {}
variable "region_zone" {}

provider "aws" {
  region = var.region_zone
}

resource "aws_key_pair" "deployer" {
  key_name   = "DEVOP"
  public_key = file(var.ssh_key_path)
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags                   = {
    name = "DEVOP"
  }
  user_data = data.template_file.install_ssh.rendered
}

resource "aws_eip" "Elastic_IP" {
  vpc      = true
  instance = aws_instance.web.id
  tags     = {
    name = "instance-eip"
  }

}

output "ip_instance" {
  value = aws_instance.web.public_ip
}

output "ssh" {
  value = "ssh -l ubuntu ${aws_instance.web.public_ip}"
}
