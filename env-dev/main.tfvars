instances = {
  mongodb = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"

  }

  cart = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "cart-docker"

  }

  user = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "user-docker"

  }

  shipping = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "shipping-docker"

  }

  payment = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "payment-docker"

  }

  mysql = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
  }

  rabbitmq = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
  }
  catalogue = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "catalogue-docker"

  }
  frontend = {
    ami_id =  "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
    ansible_role = "frontend-docker"

  }
}
zone_id = "Z0388353395L515P1D630"
vpc_security_group_ids = ["sg-04164efe3462b5107"]
env = "dev"

eks = {
 main = {
   subnets = [ "subnet-03c2c66a0914187ce", "subnet-0f1d94be8a09185ce"]
   eks_version = 1.32
   node_groups = {
     main = {
       min_nodes = 1
       max_nodes = 10
       instance_types = ["t3.medium", "t3.large"]
     }
   }
 }
}
