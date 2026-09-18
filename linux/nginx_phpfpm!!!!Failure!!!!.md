# Date: 2026-09-14
---
# [Goal]
he Nautilus application development team is planning to launch a new PHP-based application, which they want to deploy on Nautilus infra in Stratos DC. The development team had a meeting with the production support team and they have shared some requirements regarding the infrastructure. Below are the requirements they shared:


a. Install nginx on app server 3 , configure it to use port 8098 and its document root should be /var/www/html.

b. Install php-fpm version 8.2 on app server 3, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if don't exist).

c. Configure php-fpm and nginx to work together.

d. Once configured correctly, you can test the website using curl http://stapp03:8098/index.php command from jump host.

NOTE: We have copied two files, index.php and info.php, under /var/www/html as part of the PHP-based application setup. Please do not modify these files.


# [Pseudocode]
- install
-  create dir
-  conf www
-  conf port
-  test
-  start

# [To-Do-List]

- [install service and cli tool]
```bash
sudo dnf install nginx php-fpm php-cli
```
- [check status of install]
```bash
nginx -v
php -v
```
- [create dir]
```bash
sudo mkdir -p /var/run/php-fpm
```

- [conf]
```bash
sudo vi /etc/php-fpm.d/www.conf
```
Ensure the socket user, group, and permissions match your Nginx user (default is no one) and update the listen socket path
```
listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660
```

- [confiqure port]
```bash
sudo vi /etc/nginx/conf.d/app.conf
```
```
server {
    listen 8098;
    server_name localhost;
    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

- [test text file]
```bash
sudo nginx -t
```

- [start services]
```bash
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl start nginx
sudo systemctl enable nginx
```

# [Edges]
- Edge: []
- Fix: []

# [Status: Failure]
- Notes: installed the wrong php-fpm version
