#!/bin/sh

echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY

terraform init
terraform apply -auto-approve
terraform output
