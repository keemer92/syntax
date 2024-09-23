output "instance_id" {
  value = aws_instance.example.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "security_group_id" {
  value = aws_security_group.my_security_group.id
}

output "iam_role_name" {
  value = aws_iam_role.example.name
}

1. 
instance_id
Why: This is the unique identifier for your EC2 instance. You need it to manage, reference, or troubleshoot that specific instance later.
2. instance_public_ip
Why: This shows the public IP address of your instance. You need this to access the instance over the internet, like for SSH or web applications.
3. s3_bucket_name
Why: This is the name of your S3 bucket. You’ll want this to upload or manage files in that bucket later.
4. vpc_id
Why: This identifies the VPC (Virtual Private Cloud) your resources are in. It’s important for understanding your network setup and for any networking tasks you may need to perform.
5. subnet_id
Why: This shows where your instance is located within the VPC. You might need this for network configurations or to manage resources in that subnet.
6. security_group_id
Why: This identifies the security group applied to your instance, which controls what traffic is allowed. You might need it when adjusting security rules or troubleshooting access issues.
7. iam_role_name
Why: This is the name of the IAM role associated with your resources. You’ll want this to manage permissions and policies related to that role.