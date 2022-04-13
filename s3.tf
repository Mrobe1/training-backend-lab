resource "aws_s3_bucket" "mikes_new_4321_bucket" {
    bucket = "talent-mike-states"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "talent-mike-states"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.mikes_new_4321_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform_lock_tbl"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}