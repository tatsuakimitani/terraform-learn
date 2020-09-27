locals {
  example_instance_type = "t3.micro"
}

# variable "example_instance_type" {
#   default     = "t3.micro"
#   description = "Instance Typeのデフォルト値"
# }

resource "aws_instance" "terraform-learn" {

  ami = "ami-0f9ae750e8274075b"
  instance_type = local.example_instance_type
  tags = {
    Name = "example"
  }
  
  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
  EOF

  
}

output "instance_id" {
  value       = aws_instance.terraform-learn.id
}
