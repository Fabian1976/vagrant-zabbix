# == Class: profile::zabbix::web
#
# Install zabbix-web with base configuration
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
class profile::zabbix::web (
  $version = $profile::zabbix::base::version
){
  class { '::zabbix::web':
    version => $version
  }
}
