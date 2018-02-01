Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provision "shell", inline: "/bin/sh /vagrant/setup/set-keys.sh"
  config.vm.provision "shell", inline: "/bin/sh /vagrant/setup/set-selinux-disabled.sh"
  config.vm.provision "shell", inline: "/bin/sh /vagrant/setup/docker/install-docker.sh"
  config.vm.provision "shell", inline: "/bin/sh /vagrant/setup/docker/init-stack.sh 192.168.56.61"

  config.vm.define "koto-vm" do |host|
    host.vm.hostname = "koto-vm"
    host.vm.network "private_network", ip: "192.168.56.61"
    host.vm.synced_folder "./", "/vagrant", type: "rsync",
      rsync__args: ["--verbose", "--rsync-path='sudo rsync'", "--archive", "--delete", "-z"]

    host.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
    end
  end
end
