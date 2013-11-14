# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"

  config.vm.box_url = "http://packages.vstone.eu/vagrant-boxes/centos-6.x-64bit-latest.box"

  config.vm.network :private_network, ip: "192.168.56.64"


  config.vm.synced_folder "www", "/var/www/html"
  config.vm.synced_folder "test", "/opt/test/"

  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
	config.vm.provider :virtualbox do |vb|
		vb.gui = false
		vb.name = 'puppet-lamp'
		vb.customize ['modifyvm', :id, '--natdnsproxy1', 'off']
	end
	
   config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "site.pp"
	 puppet.module_path = "modules"
   end

end
