# Installs and configures Nginx web server

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
}

file { '/etc/nginx/sites-enabled/default':
  ensure  => present,
  content => "server {
    listen 80;
    listen [::]:80 default_server;
    location /redirect_me {
        return 301 https://www.github.com/Cofucan;
    }
  }",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-enabled/default'],
}
