#!/bin/bash
aws --profile default-aws-profile cloudformation create-stack --stack-name STACK0001 --template-body file://template.yaml --capabilities CAPABILITY_IAM --parameters ParameterKey=VPC0001Name,ParameterValue=vpc-0001-example ParameterKey=VPC0001Cidr,ParameterValue="172.16.0.0/16"

aws cloudformation create-stack --stack-name STACK0001 --template-body file://template.yaml --capabilities CAPABILITY_IAM --parameters ParameterKey=VPC0001Name,ParameterValue=vpc-0001-example ParameterKey=VPC0001Cidr,ParameterValue="172.16.0.0/16"