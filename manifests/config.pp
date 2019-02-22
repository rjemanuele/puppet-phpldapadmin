# PRIVATE CLASS: not to be invoked directly
class phpldapadmin::config inherits ::phpldapadmin{
  
  class { 'apache':
    default_vhost => true,
    mpm_module    => 'prefork',
  }

  include apache::mod::php

  file { '/var/phpldapadmin':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  vcsrepo { '/var/phpldapadmin':
    ensure   => 'present',
    provider => 'git',
    source   => $phpldapadmin::git_source,
  }

  create_resources('apache::vhost', $phpldapadmin::vhosts)

  file { '/var/phpldapadmin/config/config.php':
    content => template('phpldapadmin/config.php.erb'),
    owner   => root,
    group   => root,
  }
}
