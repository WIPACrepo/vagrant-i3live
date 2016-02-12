# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

box = 'scientificlinux-61-new'
url = 'https://atlas.hashicorp.com/ringo/boxes/scientific-linux-6.1/versions/0.3/providers/virtualbox.box'
ram = 1024
hostname = 'SL61'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = box
  config.vm.box_url = url
  config.vm.host_name = hostname
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  # config.ssh.forward_agent = true
  config.ssh.pty= true

  # Customize VM ram size
  config.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", ram]
      vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Needed for pip, ...
  config.vm.provision "shell", path: "bash/install-epel.sh"
  # Needed for mongo
  config.vm.provision "shell", path: "bash/install-mongo.sh"
  # Install other software dependencies for live
  config.vm.provision "shell", path: "bash/install-live-deps.sh"
end
