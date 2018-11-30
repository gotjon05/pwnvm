# pwnvm_libvert
# Setting up Vagrant with a libvert provider


### 1. Install Vagrant 
Linux: sudo apt-get install vagrant

### 2. Installing Libvert
https://developer.fedoraproject.org/tools/vagrant/vagrant-libvirt.html
sudo dnf install vagrant-libvirt
sudo systemctl enable libvirtd
lsmod | grep kvm

### 3. Clone this project and cd to clone dir. 
Build VM and provision: vagrant up

### 4. To avoid having to login everytime you ssh into vagrant
sudo gpasswd -a ${USER} libvirt
newgrp libvirt
