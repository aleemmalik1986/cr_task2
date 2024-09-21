#!/bin/bash
# Input aws region, secret1 username, secret1 password and secret2 key
read -p "Enter the AWS Region:" AWS_REGION
read -p "Enter the secret 1 username:" SECRET_1_USERNAME
read -p "Enter the secret 1 password:" SECRET_1_PASSWORD
read -p "Enter the secret 2 key:" SECRET_2_KEY

# export values this is to enhance security to not commit keys and passwords to git
# which is strictly prohibitied 
export AWS_REGION
export SECRET_1_USERNAME
export SECRET_1_PASSWORD
export SECRET_2_KEY

# run terragrunt apply to excecute the smaas module
cd ../deploy/secrets/
terragrunt apply -auto-approve
cd ../../scripts
