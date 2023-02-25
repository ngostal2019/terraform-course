module "s3_bucket_website_child_module" {
  source  = "app.terraform.io/uct-demo1/s3-website/aws"
  version = "1.0.1"
  # insert required variables here
  bucket_name = var.s3_bucket_name
  tags        = var.s3_tags
}