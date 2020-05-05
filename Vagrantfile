# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.vm.provision :hostmanager
  config.vm.define 'puppetmaster', primary: true do |puppetmaster|
    puppetmaster.vm.box = 'cmc/cis-centos77'
    puppetmaster.vm.hostname = 'puppetmaster.mdt-cmc.local'
    puppetmaster.vm.network 'private_network', bridge: 'vboxnet5', ip: '10.10.10.32'

    puppetmaster.vm.provider 'virtualbox' do |vb|
      vb.customize ["modifyvm", :id, "--paravirtprovider", "none"]
      vb.memory = 4096
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/puppetmaster.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.gui = true
      vb.name = 'puppetmaster'
    end
    #run provisioning
    puppetmaster.vm.synced_folder 'puppet/hieradata', '/etc/puppetlabs/code/environments/production/hieradata/'
    puppetmaster.vm.synced_folder 'puppet/manifests', '/etc/puppetlabs/code/environments/production/manifests/'
    puppetmaster.vm.synced_folder 'puppet/modules', '/etc/puppetlabs/code/environments/production/modules/'
    puppetmaster.vm.provision :shell,
      path: 'bootstrap_puppetmaster.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
  config.vm.define 'zabbix34', autostart: false do |zabbix34|
    zabbix34.vm.box = "cmc/cis-centos77"
    zabbix34.vm.hostname = 'zabbix34.mdt-cmc.local'
    zabbix34.vm.network "private_network", bridge: "vboxnet5", ip: "10.10.10.135"
    zabbix34.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--paravirtprovider", "none"]
      vb.memory = 2048
      vb.customize ["modifyvm", :id, "--vram", "20"]
      file_to_disk = './tmp/zabbix34_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.gui = true
      vb.name = "zabbix34-server"
    end
    #provision
    zabbix34.vm.provision :shell,
      path: "bootstrap.sh",
      upload_path: "/home/vagrant/bootstrap.sh"
  end
  config.vm.define 'zabbix42', autostart: true do |zabbix42|
    zabbix42.vm.box = "cmc/cis-centos77"
    zabbix42.vm.hostname = 'zabbix42.mdt-cmc.local'
    zabbix42.vm.network "private_network", bridge: "vboxnet5", ip: "10.10.10.136"
    zabbix42.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--paravirtprovider", "none"]
      vb.memory = 2048
      vb.customize ["modifyvm", :id, "--vram", "20"]
      file_to_disk = './tmp/zabbix42_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.gui = true
      vb.name = "zabbix42-server"
    end
    #provision
    zabbix42.vm.provision :shell,
      path: "bootstrap.sh",
      upload_path: "/home/vagrant/bootstrap.sh"
  end
end
