module "s3_bucket_website_child_module" {
  source      = "./modules/aws-s3-static-website-bucket" # Mandatory path to the child module
  bucket_name = var.s3_bucket_name
  tags        = var.s3_tags
}