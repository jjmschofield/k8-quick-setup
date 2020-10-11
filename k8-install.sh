# setup on the master node

# add gpg code
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# add k8 apt repository
sudo bash -c 'cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

# update
sudo apt-get update

# check version
apt-cache policy kubelet | head -n 20

# install
sudo apt-get install -y docker.io kubelet kubeadm kubectl

# lock version so apt can't update, k8 will manage its own updates
sudo apt-mark hold docker.io kubectl kubeadm kubectl

# check service status
sudo systemctl status kubelet.service
sudo systemctl status docker.service

# ensure up and running
sudo systemctl enable kubelet.service
sudo systemctl enable docker.service
