cat <<'EOF' > policy-assume-ec2-ssm.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

aws iam create-role --role-name ec2-instance-ssm-corerole --assume-role-policy-document file://policy-assume-ec2-ssm.json

aws iam attach-role-policy --role-name ec2-instance-ssm-corerole --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
aws iam create-instance-profile --instance-profile-name ec2-instance-ssm-corerole-profile
aws iam add-role-to-instance-profile --instance-profile-name c2-instance-ssm-corerole-profile --role-name ec2-instance-ssm-corerole

aws ec2 associate-iam-instance-profile --iam-instance-profile Name=c2-instance-ssm-corerole-profile --instance-id i-xyz

aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.ssm
aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.ec2
aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.ec2messages
aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.ssmmessages
aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.kms
aws ec2 create-vpc-endpoint --vpc-endpoint-type Interface --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.logs
aws ec2 create-vpc-endpoint --vpc-endpoint-type Gateway --vpc-id vpc-xyz --service-name com.amazonaws.us-east-1.s3

aws ec2 modify-vpc-endpoint --vpc-endpoint-id vpce-xyz --add-subnet-ids subnet-xyz subnet-002
[..]

#aws ec2 modify-vpc-endpoint --vpc-endpoint-id vpce-001 --add-security-group-ids sg-xyz --remove-security-group-ids sg-xyz001
#[..]





