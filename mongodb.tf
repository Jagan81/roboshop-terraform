resource "aws_instance" "mongodb" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "mongodb"
  }


  # provisioner "remote-exec" {
  #
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #   inline = [
  #     "Sudo pip3.11 install ansible",
  #     "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible roboshop.yml -e component_name=mongodb -e env=dev,"
  #   ]
  # }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z0388353395L515P1D630"
  name = "mongodb-dev"
  type = "A"
  ttl = 10
  records = [aws_instance.mongodb.private_ip]
}

resource "null_resource" "mongodb" {
  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.mongodb.private_ip
    }
    inline = [
      "Sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible roboshop.yml -e component_name=mongodb -e env=dev,"
    ]
  }
}