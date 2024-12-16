node 'puppet-client1' {
  user { 'naushad':
    ensure     => present,
    managehome => true,
    comment    => 'User naushad',
  }

  user { 'john':
    ensure     => present,
    managehome => true,
    comment    => 'User john',
  }

  user { 'mike':
    ensure     => present,
    managehome => true,
    comment    => 'User mike',
  }
}
