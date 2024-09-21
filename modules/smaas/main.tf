provider "aws" {
  region = var.aws_region
}

resource "aws_secretsmanager_secret" "secret_1" {
  name = "testing/secret1"
}

resource "aws_secretsmanager_secret_version" "secret_1_version" {
  secret_id = aws_secretsmanager_secret.secret_1.id
  secret_string = jsonencode({
    name     = var.secret_1_username
    password = base64encode(var.secret_1_password)
  })
}

resource "aws_secretsmanager_secret" "secret_2" {
  name = "testing/secret2"
}

resource "aws_secretsmanager_secret_version" "secret_2_version" {
  secret_id = aws_secretsmanager_secret.secret_2.id
  secret_string = jsonencode({
    key = var.secret_2_key
  })
}
