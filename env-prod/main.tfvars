instances = {
  mongodb = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
  }
  catalogue = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
  }
  frontend = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
  }
}
zone_id = "Z0388353395L515P1D630"

vpc_security_group_ids = ["sg-04164efe3462b5107"]
env = "prod"
