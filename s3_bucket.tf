resource "aws_s3_bucket" "kops_state_store" {
  bucket = "tanisha-k8s-bucket"
  force_destroy = true

  tags = {
    Name = "Kops State Store"
  }
}

resource "aws_s3_bucket_versioning" "kops_state_store_versioning" {
  bucket = aws_s3_bucket.kops_state_store.id

  versioning_configuration {
    status = "Enabled"
  }
}

