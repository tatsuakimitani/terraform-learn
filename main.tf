provider "aws"{
  region = "ap-northeast-1"
}

variable "env" {}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = var.env == "prod" ? "m5.large" : "t3.micro"
}

output "example_public_dns" {
  value       = aws_instance.example.public_dns
}
