# get yaml files to create pod network
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

# look inside to see where IP address is set
vi calico.yaml

# Create cluster
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=172.16.94.10


# [kubeconfig] Using kubeconfig folder "/etc/kubernetes"
# [kubeconfig] Writing "admin.conf" kubeconfig file
# [kubeconfig] Writing "kubelet.conf" kubeconfig file
# [kubeconfig] Writing "controller-manager.conf" kubeconfig file
# [kubeconfig] Writing "scheduler.conf" kubeconfig file

# To start using your cluster, you need to run the following as a regular user:

#  mkdir -p $HOME/.kube
#  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#  sudo chown $(id -u):$(id -g) $HOME/.kube/config

#You should now deploy a pod network to the cluster.
#Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
#  https://kubernetes.io/docs/concepts/cluster-administration/addons/

#Then you can join any number of worker nodes by running the following on each as root:

#kubeadm join 10.0.2.15:6443 --token kkyrm1.wgtpo3yr3mwsg34c \
    #--discovery-token-ca-cert-hash sha256:95b518f9e1dc992b45a3bb4520699cb0342a42fc7bb5c3d2cfe7eb36476b5030 

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


# had to change ip address in bunch of files in /etc/kubenetes

# think something is out of date, had to run this
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
# and this
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml