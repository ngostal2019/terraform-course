variable "bucket_name" {
  description = "Unique Name Across The Enire AWS Cloud"
  type        = string
}

variable "tags" {
  description = "Map of s3 bucket Tags"
  type        = map(string)
  default     = {}
}