#!/bin/sh

echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY

terraform init
terraform apply -auto-approve
echo "SPINNAKER_PROPERTY_DB_ADDRESS=$(terraform output db_address)"
echo "SPINNAKER_PROPERTY_DB_NAME=$(terraform output db_name)"
echo "SPINNAKER_PROPERTY_DB_SECRET=$(terraform output db_secret)"
echo "SPINNAKER_PROPERTY_DB_USERNAME=$(terraform output db_username)"
