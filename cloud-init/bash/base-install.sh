#!/bin/bash

apt update
apt install -y git curl wget openstack-clients vim awscli
echo "vbhost-001" > /etc/hostname
hostname vbhost-001
