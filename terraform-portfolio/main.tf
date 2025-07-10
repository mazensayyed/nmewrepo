# Terraform configuration for Open Source Portfolio Website
#
# This project is open source and intended for anyone to use as a template for deploying a static portfolio website on AWS S3.
# Contributions, issues, and feature requests are welcome!
#
# Repository: https://github.com/your-username/terraform-portfolio-template

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "portfolio_bucket" {
  bucket = "my-portfolio-website-bucket-123456"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "website_files" {
  for_each = fileset("../portfolio-website", "**/*")
  bucket   = aws_s3_bucket.portfolio_bucket.id
  key      = each.value
  source   = "../portfolio-website/${each.value}"
  acl      = "public-read"
  content_type = lookup({
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
    png  = "image/png"
    jpg  = "image/jpeg"
    jpeg = "image/jpeg"
    svg  = "image/svg+xml"
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}

output "website_url" {
  value = aws_s3_bucket.portfolio_bucket.website_endpoint
}
