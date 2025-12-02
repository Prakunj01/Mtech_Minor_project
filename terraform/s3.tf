resource "aws_s3_bucket" "site_bucket" {
  bucket = var.bucket_name

  # optional: block public access and let CloudFront access via OAC
  acl = "private"
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
