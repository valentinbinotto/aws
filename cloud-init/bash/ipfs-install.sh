#!/bin/bash
apt update
apt install -y git curl wget openstack-clients vim awscli
wget https://dist.ipfs.tech/kubo/v0.34.0/kubo_v0.34.0_linux-amd64.tar.gz
tar -xvzf kubo_v0.34.0_linux-amd64.tar.gz
bash kubo/install.sh
su -c "ipfs init" -s /bin/bash admin

cat <<'EOF' > /etc/systemd/system/ipfs.service
[Unit]
Description=InterPlanetary File System (IPFS) daemon

[Service]
ExecStart=/usr/local/bin/ipfs daemon
User=admin
Group=admin

RuntimeMaxSec=1800
Restart=on-failure

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable ipfs.service
systemctl start ipfs.service
ipfs pin add 
