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
  $agent_server_ip = '127.0.0.1',
  $agent_listenip = '127.0.0.1'
) {
  class { 'zabbix':
    zabbix_url => 'zabbix.vermont24-7.lan'
  }
  include apache::mod::php
  class {'zabbix::agent':
    server   => $agent_server_ip,
    listenip => $agent_listenip
  }
}
