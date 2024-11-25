package { 'httpd':
  ensure => latest,
}
service { 'httpd':
  ensure     => running,
  enable     => true,
  require    => Package['httpd'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => "Welcome To Ansible Class! \n",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  require => Package['httpd'],
}
