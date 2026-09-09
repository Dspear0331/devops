# Date: 2026-09-09
---
# [Goal]


# [Pseudocode]
install nginx

# [To-Do-List]
- [install]
 ```bash
sudo dnf install nginx -y
```

- [enable/start]
```bash
sudo systemctl enable --now nginx
```

- [mv files]
```bash
sudo mkdir /etc/nginx/ssl
sudo mv /tmp/nautilus.crt /etc/nginx/ssl
sudo mv /tmp/nautilus.key /etc/nginx/ssl
sudo chmod 644 /etc/nginx/ssl/nautilus.crt
sudo chmod 600 /etc/nginx/ssl/nautilus.key
```

- [configure nginx]
```bash
sudo vi /etc/nginx/nginx.conf
```
- change server name
- change .crt and key path to /etc/nginx/ssl/

- [ensure nginx is setup properly]
```bash
sudo nginx -t
```
- [restart service]
```bash
sudo systemctl restart nginx
```

- [welcome html]
```bash
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
```

- [test]
```bash
curl -Ik https://<hostname>/
```

# [Edges]
Edge: Make sure that when in the .conf pay attn to spelling, open/close brackets, and a semicolon after every task
fix: []

# [Status: Success / Failure]
- Notes: In this lab it has us change nginx.conf. I have found that in my research nginx updates .conf and break. also make sure to create a back up of the .conf file 
```bash
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
```
