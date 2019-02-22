# PRIVATE CLASS: not to be invoked directly
class phpldapadmin::repo {
  include ::apt

  apt::source { 'PHP7':
    comment  => 'PHP 7.0 repo required for PHP 7.0 deps',
    location => 'http://packages.dotdeb.org',
    release  => 'jessie',
    repos    => 'all',
    key      => {
      'id'     => '6572BBEF1B5FF28B28B706837E3F070089DF5277',
      'server' => 'hkp://keyserver.ubuntu.com:80',
    },
    include  => {
      'deb' => true }
  }
}
