node 'puppet-client1' {
  $user_list = ['mary', 'joe', 'bob']

  $user_list.each |String $username| {
    user { $username:
      ensure     => present,
      managehome => true,
      comment    => "User ${username}",
    }
  }
}
