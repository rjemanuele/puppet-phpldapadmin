# PRIVATE CLASS: not to be invoked directly
class phpldapadmin::install {

  package { 'php7.4-cli':            ensure => 'installed' }
  package { 'php7.4-ldap':           ensure => 'installed' }
  package { 'libapache2-mod-php7.4': ensure => 'installed' }
  package { 'php7.4':                ensure => 'installed' }
  package { 'php7.4-xml':            ensure => 'installed' }
  package { 'git':                   ensure => 'installed' }
}
