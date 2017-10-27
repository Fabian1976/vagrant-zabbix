# == Class: profile::zabbix::full_server
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
class profile::zabbix::full_server (
  $version = $profile::zabbix::base::version
){
  class { 'apache':
    mpm_module => 'prefork',
  }
  include apache::mod::php

  class { 'postgresql::server': }

  class { 'zabbix':
    zabbix_url    => '10.10.10.135',
  }
}
