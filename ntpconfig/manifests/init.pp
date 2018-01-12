# == Class: ntpconfig
#
# Full description of class ntpconfig here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ntpconfig':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class ntpconfig {
service { 'ntpd':
ensure  => running,
require => [Package['ntp'],File['/etc/ntp.conf'],
],
}
package { 'ntp':
ensure => present,
before => Service['ntpd'],
}
file { '/etc/ntp.conf':
ensure => file,
mode   => '0600',
source => 'puppet:///modules/ntpconfig/ntp.conf',
before => Service['ntpd'],
}
}
