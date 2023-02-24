/*resource "aws_s3_bucket" "s3bcket_name" {
  bucket        = "${var.s3bucket_fix_name}-tfm-${var.s3bucket_env}-bucket"
  force_destroy = var.s3bucket_forrce_destroy
  tags= {
    "Name"        = "${var.s3bucket_fix_name}-tfm-${var.s3bucket_env}-bucket"
    "Environment" = var.s3bucket_env
  }
}
*/

resource "aws_s3_bucket" "s3bcket_name" {
  bucket        = local.bucket_name
  force_destroy = var.s3bucket_forrce_destroy
  tags = {
    "Name"        = local.bucket_name
    "Environment" = var.s3bucket_env
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.s3bcket_name.id
  acl    = var.aws_s3_bucket_acl
}