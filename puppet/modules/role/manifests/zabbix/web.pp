# == Class: role::zabbix::web
#
# Install's Zabbix web frontend
#
# === Parameters
#
# $version:
#   This parameter allows you to set a specifiec version
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::web (
  $version = '3.2.0'
){
  if ! defined(Class['profile::zabbix::base']) {
    class { '::profile::zabbix::base':
      version => $version
    }
  }

  include profile::zabbix::web
}
