#!/usr/bin/sh

# install docker libs
yum install -y yum-utils device-mapper-persistent-data lvm2

# add docker ce software information with aliyun
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# install docker ce
yum makecache fast
yum -y install docker-ce

# start docker
systemctl start docker

# start docker after reboot
systemctl enable docker

# configure aliyun mirror's repository
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://7uh4zdh9.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload

sudo systemctl restart docker