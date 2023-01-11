resource "aws_s3_bucket" "tfm_s3bucket" {
  for_each = {
    "dev"  = "tfm-bucket-d"
    "qa"   = "tfm-bucket-q"
    "stag" = "tfm-bucket-s"
    "perf" = "tfm-bucket-pe"
    "prod" = "tfm-bucket-pr"
  }
  bucket = "${each.key}-${each.value}"
  tags = {
    Environment         = each.key
    Bucket_suffix_value = each.value
    Full_Bucket_Name    = "${each.key}-${each.value}"
    "${each.key}"       = "${each.value}"
  }
}