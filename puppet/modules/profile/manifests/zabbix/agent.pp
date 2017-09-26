# == Class: profile::zabbix::agent
#
# Install zabbix-agent with base configuration
#
# === Parameters
#
# $zabbix_server
#   This parameter sets the IP adress of the Zabbix server
#
# $version:
#   This parameter allows you to set a specifiec version. Defaults to 2.4.5
#
# $configure_firewall_rules:
#   Tells the Zabbix agent module to the create appropiate firewall rules
#
# === Variables
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::agent (
  $zabbix_server,
  $version = '3.2.0',
  $configure_firewall_rules = true,
){
  include stdlib
  if ! defined(Class['profile::zabbix::base']) {
    class { '::profile::zabbix::base':
      version => $version
    }
  }
  class { '::zabbix::agent':
    server                   => $zabbix_server,
    configure_firewall_rules => $configure_firewall_rules,
    require                  => Selinux::Module['zabbix_process']
  }
  if $::osfamily == 'RedHat' {
    selinux::module { 'zabbix_netlink_tcpdiag_socket':
      source      => 'puppet:///modules/profile/selinux/zabbix/zabbix_netlink_tcpdiag_socket.te',
      prefix      => '',
    }
    selinux::module { 'zabbix_process':
      source      => 'puppet:///modules/profile/selinux/zabbix/zabbix_process.te',
      prefix      => '',
    }
  }
}
