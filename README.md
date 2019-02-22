# phpLDAPadmin

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with phpldapadmin](#setup)
    * [What phpldapadmin affects](#what-phpldapadmin-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with phpldapadmin](#beginning-with-phpldapadmin)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module installs and configures phpLDAPadmin with php 7.0. Compared to
the packaged version of phpLDAPadmin on e.g. Debian 8, php version 5 (EOL)
is still being used.

## Setup

### What phpLDAPadmin affects

The module affects the installation of phpLDAPadmin as well as the required
dependencies to run this web application. Furthermore, a repository for the
dependencies is added as well.

### Setup Requirements

* Puppet >= 5.00
* [Stdlib Module](https://forge.puppet.com/puppetlabs/stdlib)
* [Apt module](https://forge.puppet.com/puppetlabs/apt)
* [Apache module](https://forge.puppet.com/puppetlabs/apache)
* [VCSrepo module](https://forge.puppet.com/puppetlabs/vcsrepo) 

### Beginning with phpldapadmin

## Usage

By default the module is configured to work with Hiera. An example
configuration of a hiera yaml file can be found below.

```yaml
---
classes:
 - phpldapadmin

phpldapadmin::vhost:
  "ldapadmin.example.com non-ssl":
    servername: "ldapadmin.example.com"
    port: "80"
    docroot: "/var/www"
    redirect_status: "permanent"
    redirect_dest: "https://ldapadmin.example.com/"
  "ldapadmin.example.com":
    port: "443"
    docroot: "/var/phpldapadmin"
    ssl: true

phpldapadmin::git_source: "https://fqdn/repo.git"

phpldapadmin::server_name: "Example LDAP"
phpldapadmin::server_ip: "192.168.1.2"
phpldapadmin::base_dn: "dc=example,dc=com"
phpldapadmin::bind_id: "cn=admin,dc=example,dc=com" 
```

If `/etc/ldap.conf` is configured to use STARTTLS (or the depricated LDAPS)
```phpldapadmin::tls``` can be set to ````true````.


## Limitations

Currently the following limitations exist with this module:
* No fully worked out rspec
* Only support for Debian 8 and Ubuntu 16.04
* Only the basic parameters for the config.php file are supported. However, this module can easily be extended.

