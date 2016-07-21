# Class: zabbixagent
# ===========================
#
# Full description of class zabbixagent here.
# Quick way to deploy the zabbix-agent and get it up and running.
# Variables
# ----------
# server 
# hostname
# activeserver
# port
#
# Examples
# --------
# Set your ALL of the variables above in your hiera yaml file as such:
# zabbixagent::server "10.10.10.10" 
# zabbixagent::port "10050"
# Authors
# -------
#
# Author Name obdnanr@gmail.com
#
# Copyright
# ---------
#
# GNU GPLv3 Brandon Kelley, unless otherwise noted.

class zabbixagent (
  $server       = '',
  $port         = '',
  $serveractive = '',
  $zabhostname  = ''
) { 
  package { "zabbix-agent":
    ensure  => installed,
  }
  service { "zabbix-agent":
    ensure  => running,
    enable  => true,
    require => Package["zabbix-agent"],
  }
  file { "/etc/zabbix/zabbix_agentd.conf":
    notify  => Service["zabbix-agent"],
    ensure  => present,
    content => template("zabbixagent/zabbix_agentd.conf.erb"),
  }
}


