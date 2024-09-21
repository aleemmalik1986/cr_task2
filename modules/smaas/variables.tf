variable "aws_region" {
  type        = string
  description = "region for the secret"
}

variable "secret_1_username" {
  type        = string
  description = "username for secret1"
}

variable "secret_1_password" {
  type        = string
  sensitive   = true
  description = "password for secret1"
}

variable "secret_2_key" {
  type        = string
  description = "key for secret2"
}
