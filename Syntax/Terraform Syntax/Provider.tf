provider "aws" {
  region  = "us-west-2"        # The AWS region to create resources in
  access_key = "YOUR_ACCESS_KEY"    # Optional: Your AWS access key
  secret_key = "YOUR_SECRET_KEY"    # Optional: Your AWS secret key
  # You can also use environment variables or AWS credentials file instead
}
