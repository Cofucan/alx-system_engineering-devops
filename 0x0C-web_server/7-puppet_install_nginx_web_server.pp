# Installs a Nginx web server

exec { 'nginx server':
  provider => shell,
  command  => '
    sudo apt-get -y update;
    sudo apt-get -y install nginx;
    echo "Hello World!" > /var/www/html/index.nginx-debian.html;
    printf %s "server {
      listen 80;
      listen [::]:80 default_server;
      location /redirect_me {
          return 301 https://www.github.com/Cofucan;
      }
    }" > /etc/nginx/sites-enabled/default;
    sudo service nginx restart',
}
