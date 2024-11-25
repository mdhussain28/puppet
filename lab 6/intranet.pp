node 'puppet-client1' {
  package { ['httpd']:
    ensure => latest,
  }
  file { '/var/www/html/index.html':
    ensure  => file,
    content => "welcome to the example.com intranet! \n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['httpd'],
  }
  service { 'httpd':
    ensure  => running,
    enable  => true,
    require => Package['httpd'],
  }
}
node 'localhost' {
  exec { 'Test intranet web server':
    command   => '/usr/bin/curl -s http://puppet-client1',
    path      => '/usr/bin',
    logoutput => true,
  }
}

