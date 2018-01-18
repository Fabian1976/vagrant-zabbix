# == Class: profile::zabbix::server
#
# Install zabbix-server with base configuration and PostgreSQL database
#
# === Parameters
#
#
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::server (
  Boolean $configure_gateway = true,
  Boolean $configure_firewall_rules = true,
) {
  if $configure_gateway {
    class { 'zabbix::server':
      javagateway => $::profile::zabbix::javagateway::listenip
    }
  } else {
    class { 'zabbix::server':
    }
  }
  if $configure_firewall_rules {
    $iptable_entries = {
      '200 Zabbix server' => {
        chain  => $::input_chain_name,
        proto  => 'tcp',
        action => 'accept',
        dport  => $::zabbix::server::listenport,
      }
    }
    create_resources('firewall', $iptable_entries)
  }
}
