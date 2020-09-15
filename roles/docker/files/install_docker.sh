#!/usr/bin/sh

# 安装Docker的依赖库
yum install -y yum-utils device-mapper-persistent-data lvm2

# 添加Docker CE的软件源信息。
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 安装Docker CE。
yum makecache fast
yum -y install docker-ce

# 启动Docker服务。
systemctl start docker

# 设置开机自动启动
systemctl enable docker

# 配置阿里云镜像仓库（镜像加速）
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://7uh4zdh9.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload

sudo systemctl restart docker