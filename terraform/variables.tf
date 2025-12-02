variable "bucket_name" {
  description = "S3 bucket name (must be globally unique, lowercase, hyphens)"
  type        = string
  default     = "minor-project-bucket"
}

variable "region" {
  default = "ap-south-1"
}
