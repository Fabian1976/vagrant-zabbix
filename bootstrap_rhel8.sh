#!/bin/bash
#Mount rhel8 iso
#!/bin/sh -eux
sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/subscription-manager.conf
mount /dev/sr0  /mnt
cp /mnt/media.repo /etc/yum.repos.d/rhel_dvd.repo
chmod 644 /etc/yum.repos.d/rhel_dvd.repo
if ! lsb_release -a | grep -qE '^Release:\s*8'; then
    sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/rhel_dvd.repo
    cat >> /etc/yum.repos.d/rhel_dvd.repo << EOF
enabled=1
baseurl=file:///mnt/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
EOF
else
    cat >> /etc/yum.repos.d/rhel_dvd.repo << EOF
enabled=0

[InstallMedia-BaseOS]
name=Red Hat Enterprise Linux 8 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[InstallMedia-AppStream]
name=Red Hat Enterprise Linux 8 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
EOF
fi

#install epel repo
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
#install entropy agent
yum install -y rng-tools
systemctl start rngd
systemctl enable rngd

#set correct timezone
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
systemctl restart rsyslog

#delete host as localhost. We're using hostmanager
sed -i '1d' /etc/hosts

#Disable ipv6 and remove ::1 localhost (gives issues with puppet if it is not removed)
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sed -i '/::1/d' /etc/hosts

#Install puppet repo
yum -y install https://yum.puppetlabs.com/puppet6-release-el-8.noarch.rpm
#Install puppet
yum -y install puppet-agent-6.28.0
source /etc/profile.d/puppet-agent.sh

sudo bash -c 'cat << EOF > /etc/puppetlabs/puppet/puppet.conf
[main]
vardir = /var/lib/puppet
logdir = /var/log/puppet
rundir = /var/run/puppet
ssldir = $vardir/ssl
server = puppetmaster.cmc.local

[agent]
report          = true
ignoreschedules = true
daemon          = false
environment     = production
runinterval     = 5m
EOF'

#Apply puppet manifest
puppet agent -t; true
systemctl start puppet
