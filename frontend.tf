resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  imstance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}
