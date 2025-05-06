resource "aws_instance" "catalogue" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-04164efe3462b5107"]

  tags = {
    Name = "catalogue"
  }

  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    inline = [
      "pip3.11 install ansible",
      "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible.git roboshop.yml -e component_name=catalogue -e env=dev,"
    ]
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0388353395L515P1D630"
  name = "catalogue-dev"
  type = "A"
  ttl = 10
  records = [aws_instance.catalogue.private_ip]
}
