# == Class: role::zabbix::web
#
# Install's Zabbix web frontend
#
# === Parameters
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::web {
  include profile::zabbix::web
}
