// Create User
resource "aws_iam_user" "storage_user" {
 name = var.iam-storage.user-name
}

resource "aws_iam_user_login_profile" "storage_user_login_profile" {
 user    = aws_iam_user.storage_user.name
}

// Create policy for the storage_user
resource "aws_iam_user_policy" "storage-policy" {
  name = var.iam-storage.policy-name
  user = aws_iam_user.storage_user.name
# Terraform's "jsonencode" function converts the following expression to valid JSON that AWS can use.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [var.iam-storage.policy-action,]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

// Output the auto generated password
output "password" {
 value = aws_iam_user_login_profile.storage_user_login_profile.password
}
