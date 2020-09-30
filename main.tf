provider "aws"{
  region = "ap-northeast-1"
}

module "dev_server" {
  source = "./httpd_server"
  instance_type = "t3.micro"
}

output "example_public_dns" {
  value       = module.dev_server.public_dns
}
