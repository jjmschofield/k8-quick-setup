# K8 Quick Setup
Based on local setup in the [this plurarlsight course](https://app.pluralsight.com/paths/certificate/certified-kubernetes-administrator)

## Getting started (Mac OS)

Create VMs:
```
# brew cask install virtualbox
# brew cask install vagrant
$ vagrant up
```

Configure hosts to have the correct IP's in.

Run through:
* k8-install.sh on master
* k8-install-master.sh on master
* k8-install-node.sh on each node

Copy `~/.kube/config` from master to each node so `kubectl` works on each node if you want.
