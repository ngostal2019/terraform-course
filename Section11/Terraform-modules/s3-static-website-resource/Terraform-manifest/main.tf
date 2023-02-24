resource "aws_s3_bucket" "bucket_specs" {
  bucket = var.bucket_name
  versioning {
    enabled = true
  }
  force_destroy = true
  policy        = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}    
EOF
  website {
    index_document = "index.html"
  }
  tags = var.tags
}

resource "aws_s3_bucket_acl" "bucket_permission" {
  bucket = aws_s3_bucket.bucket_specs.id
  acl    = "public-read"
}

resource "aws_s3_object" "s3_upload_file" {
  bucket = aws_s3_bucket.bucket_specs.id
  source = "index.html" # Local path to the file
  key    = "index.html" # The formal name in the s3Bucket
  content_type = "text/html"
}