FROM hashicorp/terraform:light
# https://hub.docker.com/r/hashicorp/terraform/

COPY rds.tf /
COPY run-terraform.sh /

ENTRYPOINT ["/run-terraform.sh"]




