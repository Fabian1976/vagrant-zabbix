# == Class: role::zabbix::server
#
# Install's Zabbix server and all necessary backend's
#
# === Parameters
#
# $version:
#   This parameter allows you to set a specifiec version. Defaults to 2.4.5
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::server {
  include profile::zabbix::server
}
