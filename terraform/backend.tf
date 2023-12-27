terraform {
  backend "s3" {
    bucket               = "tf-state-quarkus"
    key                  = "development/terraform.quarkus.tfstate"
    workspace_key_prefix = "demo"
    region               = "us-east-1"
    encrypt              = true
  }
}
