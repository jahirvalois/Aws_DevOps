resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  
  versioning {
    enable = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" 
      }
    }
  }
  
  object_lock_configuration {
    object_lock_enabled="Enabled"
  }

  tags = {
    Name        = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.b.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}