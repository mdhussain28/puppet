node 'puppet-client1' {
  package { 'httpd':
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
  exec { 'check_local_time':
    command => '/bin/date',
    path    => ['/bin', '/usr/bin'],
    logoutput => true,   # This ensures the command output is displayed
    notify  => Notify['local_time_output'],
  }
  notify { 'local_time_output':
    message => 'Local time fetched successfully',
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
