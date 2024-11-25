class setup_facts {
  file { '/etc/puppetlabs/facter':
    ensure => directory,
  }
  file { '/etc/puppetlabs/facter/facts.d':
    ensure  => directory,
    require => File['/etc/puppetlabs/facter'],
  }
  file { '/etc/puppetlabs/facter/facts.d/custom.fact':
    ensure  => file,
    content => "[general]\npackage = httpd\nservice = httpd\nstate = started\nenabled = true\n",
    require => File['/etc/puppetlabs/facter/facts.d'],
  }
}
include setup_facts
