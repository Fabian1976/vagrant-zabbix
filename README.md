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

When it is finished, you can access Zabbix via [URL](http://zabbix.vermont24-7.lan)
