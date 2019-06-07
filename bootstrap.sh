#!/bin/bash
#install epel repo
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#install entropy agent
yum install -y haveged
systemctl start haveged
systemctl enable haveged

#set correct timezone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
systemctl restart rsyslog

#Install puppet repo
yum -y install http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
#Install puppet
yum -y install puppet
#Remove default manifests and modules and replace them with the one from the vagrant share
rm -rf /etc/puppetlabs/code/environments/production/manifests; ln -s /vagrant/puppet/manifests /etc/puppetlabs/code/environments/production/manifests
rm -rf /etc/puppetlabs/code/environments/production/modules; ln -s /vagrant/puppet/modules /etc/puppetlabs/code/environments/production/modules
rm -rf /etc/puppetlabs/code/environments/production/hieradata; ln -s /vagrant/puppet/hieradata /etc/puppetlabs/code/environments/production/hieradata

#Firewall prereq
yum -y remove firewalld
yum -y install iptables-services

#Apply puppet manifest
/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
