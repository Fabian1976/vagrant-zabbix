# == Class: role::zabbix::java_gateway
#
# Install's Zabbix java_gateway
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
class role::zabbix::java_gateway (
  $version = '3.2.0'
){
  if ! defined(Class['profile::zabbix::base']) {
    class { '::profile::zabbix::base':
      version => $version
    }
  }

  include profile::zabbix::java_gateway
}
