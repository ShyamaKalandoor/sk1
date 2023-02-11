resource "aws_s3_bucket" "example" {
  bucket = "example"
}


resource "aws_s3_bucket" "example_log_bucket" {
  bucket = "example-log-bucket"
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.example.id

  target_bucket = aws_s3_bucket.example_log_bucket.id
  target_prefix = "log/"
}


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}