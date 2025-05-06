resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-04164efe3462b5107"]

  tags = {
    Name = "frontend"
  }
}


resource "aws_route53_record" "frontend" {
  zone_id = "Z0388353395L515P1D630"
  name = "frontend-dev"
  type = "A"
  ttl = 10
  records = [aws_instance.frontend.private_ip]
}