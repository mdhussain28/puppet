class deploy_packages {
  $web_pkg          = lookup('web_pkg')
  $web_service      = lookup('web_service')

  package { [$web_pkg]:
    ensure => installed,
  }

  service { [$web_service]:
    ensure     => running,
    enable     => true,
    require    => Package[$web_pkg],
  }

  file { '/var/www/html':
    ensure => directory,
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "Example web content related to variable\n",
    require => File['/var/www/html'],
  }
}

node 'puppet-client3' {
  include deploy_packages
}
