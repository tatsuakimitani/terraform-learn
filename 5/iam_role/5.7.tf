# 入力項目
# name - IAM ロール と IAM ポリシー の 名前 
# policy - ポリシードキュメント 
# identifier - IAM ロール を 紐 づける AWS の サービス 識別子

variable "name" {}
variable "policy" {}
variable "identifier" {}

resource "aws_iam_role" "default"{
    name = var.name
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role"{
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type = "Service"
            identifiers = [var.identifier]
        }
    }
}

resource "aws_iam_policy" "default"{
    name = var.name
    policy = var.policy
}

resource "aws_iam_role_policy_attachment" "default" {
    role = aws_iam_role.default.name
    policy_arn = aws_iam_policy.default.arn
}

output "iam_role_arn" {
  value       = aws_iam_role.default.arn
}
