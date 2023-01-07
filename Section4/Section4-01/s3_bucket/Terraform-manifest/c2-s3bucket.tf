resource "random_pet" "random_name" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "s3bcket_name" {
  bucket        = random_pet.random_name.id
  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.s3bcket_name.id
  acl    = "public-read"
}