resource "aws_s3_bucket" "helm-charts-spinnaker-lab" {
  bucket = "helm-charts-spinnaker-lab"
  acl    = "public-read-write"

  tags = {
    Name        = "helm-charts-spinnaker-lab"
    Purpose     = "Store Helm Charts for Spinnaker Lab"
    Terraform   = true
  }
}

resource "aws_s3_bucket" "spin-spinnaker-lab" {
    bucket = "spin-spinnaker-lab"
    acl    = "private"

    tags = {
    Name        = "spin-spinnaker-lab"
    Purpose     = "Store Spinnaker state for Spinnaker Lab"
    Terraform   = true
    }
}





