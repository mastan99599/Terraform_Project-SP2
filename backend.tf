terraform {
  backend "s3" {
    bucket = "shaik2690"
    key    = "shaik.tfstate"
    region = "ap-south-1"
    dynamodb_table = "shaik_table"
  }
}