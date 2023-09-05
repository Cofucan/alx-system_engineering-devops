# Puppet manifest to configure Nginx with a custom 404 page and a redirection rule.

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Ensure custom HTTP header is added to Nginx config
exec { 'add_custom_header':
  command     => "grep -q 'add_header X-Served-By \$hostname;' /etc/nginx/nginx.conf || " +
                "sudo sed -i '/^http {/a \\tadd_header X-Served-By \$hostname;' /etc/nginx/nginx.conf",
  path        => '/usr/bin:/usr/sbin:/bin',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-enabled/default'],
  notify      => Service['nginx'],
}

# Ensure the Nginx service is running and enabled
service { 'nginx':
  ensure => 'running',
  enable => true,
}
