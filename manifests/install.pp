# PRIVATE CLASS: not to be invoked directly
class phpldapadmin::install {

  package { 'php7.0-cli':            ensure => 'installed' }
  package { 'php7.0-ldap':           ensure => 'installed' }
  package { 'libapache2-mod-php7.0': ensure => 'installed' }
  package { 'php7.0':                ensure => 'installed' }
  package { 'php7.0-xml':            ensure => 'installed' }
  package { 'git':                   ensure => 'installed' }
}
