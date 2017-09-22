# == Class: profile::zabbix::java_gateway
#
# Install zabbix-java-gateway with base configuration
#
# === Parameters
#
# $version:
#   This parameter allows you to set a specifiec version. Defaults to 2.4.5
#
# === Variables
#
# === Authors
#
# Fabian van der Hoeven <fabian.vanderhoeven@vermont24-7.com>
#
class profile::zabbix::java_gateway (
  $version = $profile::zabbix::base::version
){
  class { '::zabbix::java_gateway':
    version => $version
  }
}
