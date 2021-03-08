#!/bin/sh
terraform init
terraform apply -auto-approve

# Output the results so we can use it within Spinnaker
# All outputs must be prefixed with SPINNAKER_PROPERTY

echo "SPINNAKER_PROPERTY_DB_ADDRESS=$(terraform output db_address)"
echo "SPINNAKER_PROPERTY_DB_NAME=$(terraform output db_name)"
echo "SPINNAKER_PROPERTY_DB_SECRET=$(terraform output db_secret)"
echo "SPINNAKER_PROPERTY_DB_USERNAME=$(terraform output db_username)"
