terraform {
  cloud {
    organization = "tf-bootcamp-21"

    workspaces {
      name = "terratowns"
    }
  }
}

data "aws_caller_identity" "current" {}

resource "random_pet" "bucket_name" {
  length    = 3
  separator = "-"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "tf-bucket-${random_pet.bucket_name.id}"
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
