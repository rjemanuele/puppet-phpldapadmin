# Class: phpldapadmin 
#
# ---
# 
# This module installs and configures PHPldapadmin on PHP 7.0.
# The reason this module doesn't install phpldapadmin from APT
#is because on Debian 8 it's still packaged with PHP5 (EOL).
# 
# ---
#
# Hiera is intended to be used in combination with the module.
# However, the module can also be modified to function without
#Hiera.
# $vhosts, takes in a hash of Apache2 vHosts.
# $server_name, accepts a string that's used as title on the web UI.
# $server_ip, takes in the IP address of the LDAP server.
# $base_dn, configures the root DN e.g. dc=example,dc=com.
# $base_id, can be used for a default placeholder on the login page
#of the web UI.
# $git_source, sets a source (including URL) that hosts the PHPldapadmin
#web application.
#
# ---
# Example
#
#classes:
#  - phpldapadmin
#
#phpldapadmin::vhost:
#  "ldapadmin.example.com non-ssl":
#    servername: "ldapadmin.example.com"
#    port: "80"
#    docroot: "/var/www"
#    redirect_status: "permanent"
#    redirect_dest: "https://ldapadmin.example.com/"
#  "ldapadmin.example.com":
#    port: "443"
#    docroot: "/var/phpldapadmin"
#    ssl: true
#
#phpldapadmin::git_source: "https://fqdn/repo.git"
#
#phpldapadmin::server_name: "Example LDAP"
#phpldapadmin::server_ip: "192.168.1.2"
#phpldapadmin::base_dn: "dc=example,dc=com"
#phpldapadmin::bind_id: "cn=admin,dc=example,dc=com" 
#
class phpldapadmin (
  $vhosts      = hiera(phpldapadmin::vhost, {}),
  $server_name = hiera(phpldapadmin::server_name, ''),
  $server_ip   = hiera(phpldapadmin::server_ip, ''),
  $base_dn     = hiera(phpldapadmin::base_dn, ''),
  $bind_id     = hiera(phpldapadmin::bind_id, ''),
  $git_source  = hiera(phpldapadmin::git_source, ''),
){

  contain phpldapadmin::repo
  contain ::phpldapadmin::install
  contain ::phpldapadmin::config

  Class['phpldapadmin::repo']
  -> Class['phpldapadmin::install']
  -> Class['phpldapadmin::config']
}
