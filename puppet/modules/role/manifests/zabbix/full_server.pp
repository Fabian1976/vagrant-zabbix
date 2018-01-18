# == Class: role::zabbix::full_server
#
# Install's Zabbix server and all necessary backend's
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::full_server (
  String $zabbix_url = $::fqdn,
) {
  include profile::postgresql::server
  include profile::zabbix::javagateway
  class { 'zabbix':
    zabbix_url => $zabbix_url,
    javagateway => $::profile::zabbix::javagateway::listenip
  }
  include apache::mod::php
  include profile::zabbix::agent
}
