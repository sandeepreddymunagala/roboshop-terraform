env ="dev"
components = {
  frontend = {
    tags = { Monitor = "true", env = "dev"}
  }
  mongodb = {
    tags = { env = "dev"}
  }
  catalogue = {
    tags = { Monitor = "true", env = "dev"}
  }
  redis = {
    tags = { env = "dev"}
  }
  user = {
    tags = { env = "dev"}
  }
  cart = {
    tags = { Monitor = "true", env = "dev"}
  }
  mysql = {
    tags = { env = "dev"}
  }
  shipping = {
    tags = { Monitor = "true", env = "dev"}
  }
  rabbitmq = {
    tags = { env = "dev"}
  }
  payment = {
    tags = { Monitor = "true", env = "dev"}
  }
  dispatch = {
    tags = { Monitor = "true", env = "dev"}
  }
}

tags = {
  company_name  = "XYZ Tech"
  business      = "ecommerce"
  business_unit = "retail"
  cost_center   = "322"
  project_name  = "roboshop"
}

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      web    = { cidr_block = ["10.0.0.0/24", "10.0.1.0/24"] }
      app    = { cidr_block = ["10.0.2.0/24", "10.0.3.0/24"] }
      db     = { cidr_block = ["10.0.4.0/24", "10.0.5.0/24"] }
      public = { cidr_block = ["10.0.6.0/24", "10.0.7.0/24"] }
    }
  }
}

default_vpc_id        = "vpc-053c37932ccf923f5"
default_vpc_rt        = "rtb-0a2b1e95368e669b9"

rabbitmq = {
  main = {
    instance_type = "t2.micro"
    component     = "rabbitmq"
  }
}