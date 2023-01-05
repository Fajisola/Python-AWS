 2  sudo apt update
    3  sudo apt install nginx -y
    4  systemctl status nginx
    5  sudo apt install software-properties-common -y
    6  sudo add-apt-repository ppa:ondrej/php
    7  sudo apt update
    8  sudo apt install php8.2-fpm php8.2-common php8.2-dom php8.2-intl php8.2-mysql php8.2-xml php8.2-xmlrpc php8.2-curl php8.2-gd php8.2-imagick php8.2-cli php8.2-dev php8.2-imap php8.2-mbstring php8.2-soap php8.2-zip php8.2-bcmath -y
    9  sudo systemctl status nginx
   10  sudo systemctl status php8.2-fpm
   11  sudo cat /etc/os-release
   12  sudo apt-get install apt-transport-https curl
   13  sudo curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'
   14  sudo sh -c "echo 'deb https://mirror.nodesdirect.com/mariadb/repo/10.9/ubuntu jammy main' >>/etc/apt/sources.list"
   15  sudo apt-get update
   16  sudo apt-get install mariadb-server
   17  sudo systemctl status mariadb
   18  mysql_secure_installation
   19  sudo su
   20  mysql_secure_installation
   21  sudo su
   22  sudo apt-get remove  mariadb-server
   23  sudo apt-get install mariadb-server
   24  sudo systemctl status mariadb
   25  sudo mysql_secure_installation
   26  sudo passwd ubuntu
   27  sudo passwd root
   36  wget -c https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-english.tar.gz
   37  tar xzvf phpMyAdmin-5.2.0-english.tar.gz
   38  ls
   39  sudo mv phpMyAdmin-5.2.0-english /usr/share/phpmyadmin
   40  sudo ln -s /usr/share/phpmyadmin /var/www/html
   41  sudo nano /etc/nginx/sites-available/default
   42  sudo vi /etc/nginx/sites-available/default
   43  sudo nginx -t
   44  sudo systemctl restart nginx
   47  sudo systemctl status php8.2-fpm
   49  sudo tail -30 /var/log/nginx/error.log
   50  sudo systemctl restart php8.2-fpm
   51  sudo vi /etc/nginx/sites-available/default
   52  sudo systemctl restart nginx
   53  sudo systemctl status nginx
   54  sudo systemctl restart php8.2-fpm
   55  sudo systemctl restart nginx




index index.php index.html index.htm;

location ~ \.php$ {
  try_files $fastcgi_script_name =404;
  include fastcgi_params;
  fastcgi_pass  unix:/run/php/php8.2-fpm.sock;
  fastcgi_index index.php;
  fastcgi_param DOCUMENT_ROOT  $realpath_root;
  fastcgi_param SCRIPT_FILENAME   $realpath_root$fastcgi_script_name; 
}
