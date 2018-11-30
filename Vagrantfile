# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.ssh.username = "vagrant"
  config.ssh.forward_agent = true
  config.vm.provision :shell, :path => "vagrant_setup.sh", :privileged => false


  config.vm.define "pwn", primary: true do |u64|
    u64.vm.box = "generic/ubuntu1804"
    u64.vm.network "private_network", ip: "10.10.10.10"
    u64.vm.provider "libvirt" do |vb|
#      vb.name = "pwn ubuntu"
      vb.memory = "2048"
#      vb.gui = false
    end
  end

end

                                                                                                
                                                                                                
                                                                                                
                                                                                                
                                                                                                

