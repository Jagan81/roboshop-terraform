variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.small"
}

 variable "vpc_security_group_ids" {
   default = ["sg-04164efe3462b5107"]
 }

variable "instances" {
  default = {
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
}

variable "zone_id" {
  default = "Z0388353395L515P1D630"
}

variable "env" {
  default = "dev"
}