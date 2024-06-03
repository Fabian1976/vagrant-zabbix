# vagrant-zabbix
Vagrant box to test my Zabbix puppet code

I use it on a Mac book

## Installation
Make sure Vagrant is installed (duh) with the hostmanager plugin (`vagrant plugin install vagrant-hostmanager`).

Make sure these packages are installed:
```
rubygem-bundler
git
```

Clone this repo:
```
git clone https://github.com/Fabian1976/vagrant-zabbix.git
```

Execute these steps:
```
$ cd vagrant-zabbix
$ bundle install
$ cd puppet
$ librarian-puppet install
$ cd ..
$ vagrant up
```

When it is finished, you can access Zabbix via [URL](http://zabbix60.cmc.local)

### Templates
If you want to work on the Generic templates, please follow these instructions:

From outside the VM, run this command:
```
./get_templates.sh
```
This will download the templates to your local devices.

Log on to the virtual machine:
```
vagrant ssh zabbix60
```

And run the following:
```
sudo -i
/vagrant/install_templates.sh
```

And uncomment the `core::profile::zabbix::full_server::templates:` parameter in the zabbix server yaml.
