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
- [ sh, -c, "echo vbhost-0001 > /etc/hostname" ]
- hostname vbhost-0001
