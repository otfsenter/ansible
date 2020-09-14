sudo test -d /etc/docker || mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://7uh4zdh9.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
