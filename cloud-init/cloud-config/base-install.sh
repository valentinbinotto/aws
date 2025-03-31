#cloud-config
repo_update: true
repo_upgrade: all

packages:
- git
- curl
- wget
- openstack-clients
- vim
- awscli

runcmd:
- [ sh, -c, "echo vbhost-0001.external-cloud-infrastructure.com > /etc/hostname" ]
- hostname vbhost-0001.external-cloud-infrastructure.com
