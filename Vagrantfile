# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "geerlingguy/centos7"
    ansible.vm.network "private_network", type: "static", ip: "192.168.99.10"
    ansible.vm.hostname = "ansible"
    ansible.vm.provider "virtualbox" do |v|
      v.name = "ansible"
      v.memory = 2048
      v.cpus = 2
    end
    ansible.vm.provision :shell do |shell|
      shell.path = "project.sh"
      shell.args = ["master", "192.168.99.10"]
    end
  end
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end
  config.vm.provision :shell, :inline => "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config; sudo systemctl restart sshd;", run: "always"
end