# PRIVATE CLASS: not to be invoked directly
class phpldapadmin::install {
  $packages = ['php7.4-cli', 'php7.4-ldap', 'libapache2-mod-php7.4',
    'php7.4', 'php7.4-xml', 'git']
  ensure_packages($packages)
}
