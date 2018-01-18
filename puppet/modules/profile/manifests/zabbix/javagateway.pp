# == Class: profile::zabbix::javagateway
#
# Install zabbix JAVA-gateway with base configuration
#
# === Parameters
#
# === Variables
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::javagateway (
  String $listenip = '127.0.0.1',
  Boolean $configure_firewall_rules = true,
) {
  class {'::zabbix::javagateway':
    listenip => $listenip
  }
  if $configure_firewall_rules {
    $iptable_entries = {
      '200 Zabbix JAVA-gateway' => {
        chain  => $::input_chain_name,
        proto  => 'tcp',
        action => 'accept',
        dport  => $::zabbix::javagateway::listenport,
      }
    }
    create_resources('firewall', $iptable_entries)
  }
}
