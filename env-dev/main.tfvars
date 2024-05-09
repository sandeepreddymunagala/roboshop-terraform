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
    tags = { Monitor = "true", env = "dev"}
  }
  payment = {
    tags = { Monitor = "true", env = "dev"}
  }
  dispatch = {
    tags = { Monitor = "true", env = "dev"}
  }
}
