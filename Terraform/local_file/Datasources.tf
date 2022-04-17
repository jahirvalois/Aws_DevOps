data "aws_s3_bucket" "selected" {
  bucket = "bucket.test.com"
}

data "aws_route53_zone" "test_zone" {
  name = "test.com."
}

resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.test_zone.id
  name    = "bucket"
  type    = "A"

  alias {
    name    = data.aws_s3_bucket.selected.website_domain
    zone_id = data.aws_s3_bucket.selected.hosted_zone_id
  }
}