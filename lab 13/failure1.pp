node 'puppet-client1' {
  package { 'http':
    ensure => present,
  }
  notify { 'http_package_status':
    message => 'http package installation attempted.',
    withpath => true,
  }
  exec { 'http_install_failure_check':
    command => 'echo "Failed to install http package" >> /var/log/puppet_error.log',
    unless  => 'rpm -q http',  # Check if the package is already installed
    path    => ['/bin', '/usr/bin'],
    refreshonly => true,
  }
  package { 'mariadb-server':
    ensure => present,
  }
  service { 'mariadb':
    ensure    => running,
    enable    => true,
    subscribe => Package['mariadb-server'], 
  }
}
