# == Class: role::zabbix::javagateway
#
# Install's Zabbix JAVA-gateway
#
# === Parameters
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::javagateway {
  include profile::zabbix::javagateway
}
