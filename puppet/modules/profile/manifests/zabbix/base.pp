# == Class: profile::zabbix::base
#
# Install zabbix base package needed for every Zabbix component
#
# === Parameters
#
# $version:
#   This parameter allows you to set a specifiec version. Defaults to 2.4.5
#
# === Variables
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::base (
  $version = '3.2.0'
){
  class { '::zabbix::base':
    version => $version
  }
}
