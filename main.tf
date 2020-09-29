provider "aws"{
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = "t3.micro"
  user_data = file("./user_data.sh")
}

output "example_public_dns" {
  value       = aws_instance.example.public_dns
}
