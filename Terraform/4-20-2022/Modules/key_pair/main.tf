resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits = 4096  
}

resource "aws_key_pair" "aws_kp" {
  keykey_name = var.key_name_kp
  public_key = tls_private_key.pk.public_key_openssh  
}

resource "aws_s3_object" "s3_object" {
  bucket = var.bucket_name
  key = "key/${var.key_pair_name}.pem"
  content = tls_private_key.pk.private_key_pem
}