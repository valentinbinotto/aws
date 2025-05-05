#!/bin/bash

apt update
apt install -y awscli

# aws --profile default-aws-profile s3 ls s3-bucket-0001
# aws s3 ls s3-bucket-0001