# == Class: role::zabbix::full_server
#
# Install's Zabbix server and all necessary backend's
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class role::zabbix::full_server {
  include profile::zabbix::full_server
}
