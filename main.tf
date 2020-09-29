provider "aws"{
  region = "ap-northeast-1"
}

data "template_file" "httpd_user_data" {
  template = file("./user_data.sh.tpl")

  vars = {
    package = "httpd"
  }
}

resource "aws_instance" "example" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = "t3.micro"
  user_data = data.template_file.httpd_user_data.rendered
}

output "example_public_dns" {
  value       = aws_instance.example.public_dns
}
