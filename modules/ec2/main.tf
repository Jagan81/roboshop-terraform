resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = var.name
  }

}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name = "${var.name}-${var.env}"
  type = "A"
  ttl = 10
  records = [aws_instance.instance.private_ip]
}

 resource "null_resource" "catalogue" {
   depends_on = [aws_route53_record.record]
   provisioner "remote-exec" {

     connection {
       type = "ssh"
       user = "ec2-user"
       password = "DevOps321"
       host = aws_instance.instance.private_ip
     }
     inline = [
       "Sudo pip3.11 install ansible",
       "ansible-pull -i localhost, -u https://github.com/jagan81/roboshop-ansible roboshop.yml -e component_name=${var.ansible_role} -e env=${var.env}"
     ]
   }
 }
