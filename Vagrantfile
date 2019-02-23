rootFolder = ENV["ROOT"]

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.synced_folder rootFolder, "/home/vagrant/Dev"
  config.vm.provision "shell", path: "provisioner.sh"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
	v.cpus = 2
  end
end
