# == Class: profile::zabbix::web
#
# Install zabbix-web with base configuration
#
# === Parameters
#
# === Variables
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::web (
  Boolean $configure_firewall_rules = true,
  Boolean $ssl_access = false,
){
  class { '::zabbix::web':
    zabbix_url  => 'zabbix.vermont24-7.lan',
  }
  include apache::mod::php
  if $configure_firewall_rules {
    if ssl_access {
      $webport = '443'
    } else {
      $webport = '80'
    }
    $iptable_entries = {
      '200 Zabbix web access' => {
        chain  => $::input_chain_name,
        proto  => 'tcp',
        action => 'accept',
        dport  => $webport,
      }
    }
    create_resources('firewall', $iptable_entries)
  }
}
