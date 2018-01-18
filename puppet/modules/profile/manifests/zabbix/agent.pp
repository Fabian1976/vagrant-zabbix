# == Class: profile::zabbix::agent
#
# Install zabbix-agent with base configuration
#
# === Parameters
#
# $zabbix_server_ip
#   This parameter sets the IP adress of the Zabbix server
#
# $configure_firewall_rules:
#   Tells the Zabbix agent module to the create appropiate firewall rules
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::agent (
  String $zabbix_server_ip = '127.0.0.1',
  $listenip = undef,
  Boolean $configure_firewall_rules = true,
){
  class { '::zabbix::agent':
    server   => $zabbix_server_ip,
    listenip => $listenip
  }
  if $configure_firewall_rules {
    $iptable_entries = {
      '200 Zabbix agent' => {
        chain  => $::input_chain_name,
        proto  => 'tcp',
        action => 'accept',
        dport  => $::zabbix::agent::listenport,
      }
    }
    create_resources('firewall', $iptable_entries)
  }
}
