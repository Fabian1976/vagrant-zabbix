# == Class: profile::zabbix::server
#
# Install zabbix-server with base configuration and PostgreSQL database
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
class profile::zabbix::server (
  $version = $profile::zabbix::base::version
){
  class { '::zabbix::db':
  }
  class { '::zabbix::server':
    version => $version
  }
}
