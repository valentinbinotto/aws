aws ec2 create-vpc --instance-tenancy "default" --cidr-block "172.16.0.0/16" --ipv6-cidr-block-network-border-group "us-east-1" --tag-specifications '{"resourceType":"vpc","tags":[{"key":"Name","value":"vpc0001.us-east-1.awcl"}]}'

aws ec2 create-internet-gateway --tag-specifications '{"resourceType": "internet-gateway","tags":[{"key":"Name","value":"igw0001.vpc0001.us-east-1.awcl"}]}'
aws ec2 attach-internet-gateway --vpc-id "vpc-XY" --internet-gateway-id "igw-xy"

aws ec2 create-subnet --vpc-id "vpc-xy" --cidr-block "" --availability-zone-id "use1-az6" --ipv6-cidr-block "xyz::/64" --tag-specifications '{"resourceType":"subnet","tags":[{"key":"Name","value":"public-subnet-0001"}]}'
aws ec2 create-subnet --vpc-id "vpc-xy" --cidr-block "" --availability-zone-id "use1-az6" --ipv6-cidr-block "xyz::/64" --tag-specifications '{"resourceType":"subnet","tags":[{"key":"Name","value":"public-subnet-0001"}]}'
aws ec2 create-subnet --vpc-id "vpc-xy" --cidr-block "" --availability-zone-id "use1-az6" --ipv6-cidr-block "xyz::/64" --tag-specifications '{"resourceType":"subnet","tags":[{"key":"Name","value":"public-subnet-0001"}]}'

aws ec2 create-route-table --vpc-id "vpc-xy" --tag-specifications '{"resourceType":"route-table","tags":[{"key":"Name","value":"private-route-table"}]}' --client-token "XYZ"

aws ec2 create-route --route-table-id "rtb-xy" --destination-cidr-block "0.0.0.0/0" --gateway-id "igw-xy"
aws ec2 create-route --route-table-id "rtb-xy" --destination-ipv6-cidr-block "::/0" --gateway-id "igw-xy"

aws ec2 create-security-group --description "Allows all traffic in and out, everywhere, Dual Stack" --group-name "allow-all-inout-every-ipv64" --vpc-id "vpc-xy"
aws ec2 create-security-group --description "Allows all traffic in and out, Only VPC, Dual Stack" --group-name "allow-all-inout-vpc-ipv64" --vpc-id "vpc-xy"
aws ec2 create-security-group --description "Allows all traffic out, everywhere, no in, Dual Stack" --group-name "allow-all-out-noin-every-ipv64" --vpc-id "vpc-xy"


