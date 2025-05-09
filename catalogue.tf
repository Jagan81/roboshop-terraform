resource "aws_instance" "catalogue" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "catalogue"
  }

  # provisioner "remote-exec" {
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #   inline = [
  #     " Sudo pip3.11 install ansible",
  #     "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible roboshop.yml -e component_name=catalogue -e env=dev,"
  #   ]
  # }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0388353395L515P1D630"
  name = "catalogue-dev"
  type = "A"
  ttl = 10
  records = [aws_instance.catalogue.private_ip]
}

resource "null_resource" "catalogue" {
  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.private_ip
    }
    inline = [
      "Sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible roboshop.yml -e component_name=catalogue -e env=dev,"
    ]
  }
}
