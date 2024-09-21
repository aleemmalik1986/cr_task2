terraform {
  source = "../../modules/smaas"
}

inputs = {
  aws_region        = get_env("AWS_REGION")
  secret_1_username = get_env("SECRET_1_USERNAME")
  secret_1_password = get_env("SECRET_1_PASSWORD")
  secret_2_key      = get_env("SECRET_2_KEY")
}
