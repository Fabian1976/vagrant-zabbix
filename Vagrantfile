# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.vm.provision :hostmanager
  config.vm.define 'puppetmaster', primary: true do |puppetmaster|
    puppetmaster.vm.box = 'cmc/cis-rhel84'
    puppetmaster.vm.hostname = 'puppetmaster.cmc.local'
    puppetmaster.vm.network 'private_network', ip: '192.168.56.32'

    puppetmaster.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--paravirtprovider', 'none']
      vb.cpus = 3
      vb.memory = 4096
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/puppetmaster.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-8.4-x86_64-dvd.iso"]
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
    zabbix34.vm.box = 'cmc/cis-rhel77'
    zabbix34.vm.hostname = 'zabbix34.cmc.local'
    zabbix34.vm.network 'private_network', ip: '192.168.56.34'
    zabbix34.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--paravirtprovider', 'none']
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/zabbix34_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-server-7.7-x86_64-dvd.iso"]
      vb.gui = true
      vb.name = 'zabbix34-server'
    end
    #provision
    zabbix34.vm.provision :shell,
      path: 'bootstrap.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
  config.vm.define 'zabbix42', autostart: false do |zabbix42|
    zabbix42.vm.box = 'cmc/cis-rhel77'
    zabbix42.vm.hostname = 'zabbix42.cmc.local'
    zabbix42.vm.network 'private_network', ip: '192.168.56.42'
    zabbix42.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--paravirtprovider', 'none']
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/zabbix42_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-server-7.7-x86_64-dvd.iso"]
      vb.gui = true
      vb.name = 'zabbix42-server'
    end
    #provision
    zabbix42.vm.provision :shell,
      path: 'bootstrap.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
  config.vm.define 'zabbix44', autostart: false do |zabbix44|
    zabbix44.vm.box = 'cmc/cis-rhel77'
    zabbix44.vm.hostname = 'zabbix44.cmc.local'
    zabbix44.vm.network 'private_network', ip: '192.168.56.44'
    zabbix44.vm.provider 'virtualbox' do |vb|
      vb.customize ['modifyvm', :id, '--paravirtprovider', 'none']
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/zabbix44_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-server-7.7-x86_64-dvd.iso"]
      vb.gui = true
      vb.name = 'zabbix44-server'
    end
    #provision
    zabbix44.vm.provision :shell,
      path: 'bootstrap.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
  config.vm.define 'zabbix52', autostart: false do |zabbix52|
    zabbix52.vm.box = 'cmc/cis-rhel84'
    zabbix52.vm.hostname = 'zabbix52.cmc.local'
    zabbix52.vm.network 'private_network', ip: '192.168.56.52'
    zabbix52.vm.provider 'virtualbox' do |vb|
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/zabbix52_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', '0', '--device', '1', '--type', 'dvddrive', '--medium', '../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-8.4-x86_64-dvd.iso']
      vb.gui = true
      vb.name = 'zabbix52-server'
    end
    #provision
    zabbix52.vm.provision :shell,
      path: 'bootstrap_rhel8.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
  config.vm.define 'zabbix60', autostart: true do |zabbix60|
    zabbix60.vm.box = 'cmc/cis-rhel84'
    zabbix60.vm.hostname = 'zabbix60.cmc.local'
    zabbix60.vm.network 'private_network', ip: '192.168.56.60'
    zabbix60.vm.provider 'virtualbox' do |vb|
      vb.cpus = 3
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '20']
      file_to_disk = './tmp/zabbix60_dbdisk.vdi'
      unless File.exist?(file_to_disk)
        vb.customize ['createhd', '--filename', file_to_disk, '--size', (32 * 1024)]
      end
      vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', '0', '--device', '1', '--type', 'dvddrive', '--medium', '../../azure_repos/ConclusionMC/cmc/packer-core_image_builder/isos/RHEL/rhel-8.4-x86_64-dvd.iso']
      vb.gui = true
      vb.name = 'zabbix60-server'
    end
    #provision
    zabbix60.vm.provision :shell,
      path: 'bootstrap_rhel8.sh',
      upload_path: '/home/vagrant/bootstrap.sh'
  end
end
