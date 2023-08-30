# Installs and configures Nginx web server with a redirect

exec { 'nginx_server':
  command => [
    '/usr/bin/apt-get', '-y', 'update',
    '/usr/bin/apt-get', '-y', 'install', 'nginx',
    '/bin/echo', 'Hello World!', '>', '/var/www/html/index.nginx-debian.html',
    '/bin/bash', '-c', 'redir="\\trewrite ^/redirect_me https://www.github.com/Cofucan permanent;"; /bin/sed -i "/listen 80 default_server/a $redir" /etc/nginx/sites-available/default',
    '/usr/sbin/service', 'nginx', 'restart'
  ],
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  require => Package['nginx'],
}
