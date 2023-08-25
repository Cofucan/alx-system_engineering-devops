# Installs flask from pip3

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command => 'pip3 install flask==2.1.0',
  creates => '/usr/local/bin/flask', # Path to check if Flask is installed
  require => Package['python3-pip'], # Make sure pip3 is installed first
}
