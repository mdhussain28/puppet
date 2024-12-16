node 'eoc-node1' {
  package { 'http':
    ensure => present,
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
