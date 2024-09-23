terraform {
    backend "s3" {
        bucket = "The name of your S3 bucket"
        key    = "terraform.tfstate" # name this whetaver you want or terraform will name it
        region = "us-west-2"
    }
}

backup
security
State Locking