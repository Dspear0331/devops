# Date: 2026-09-09
---
# [Goal]
Day by day traffic is increasing on one of the websites managed by the Nautilus production support team. Therefore, the team has observed a degradation in website performance. Following discussions about this issue, the team has decided to deploy this application on a high availability stack i.e on Nautilus infra in Stratos DC. They started the migration last month and it is almost done, as only the LBR server configuration is pending. Configure LBR server as per the information given below:


a. Install nginx on the LBR (load balancer) server if it is not already installed.

b. Configure load-balancing with the http context making use of all App Servers. Ensure that you update only the main Nginx configuration file located at /etc/nginx/nginx.conf.

c. Make sure you do not update the apache port that is already defined in the apache configuration on all app servers, also make sure apache service is up and running on all the app servers.

d. Once done, you can access the website by running curl http://stlb01:80 in the terminal.


# [Pseudocode]
- install
- check which port stapp01,stapp02,stapp03 are listening on
- config load balancer
- restart service
- confirm
  
# [To-Do-List]

- [install and start service]
    ```bash
    sudo dnf install -y nginx && sudo systemctl enable --now nginx
    ```
- [confirm status of httpd on stapp01,stapp02,stapp03]
```bash
sudo systemctl staus httpd
#which port
sudo ss -tunlp | grep httpd
```
- [update .conf]
```bash
sudo vi /etc/nginx/nginx.conf
```
- http block upstream
```bash
upstream app_backend {
    server stapp01:<targetport>;
    server stapp02:<targetport>;
    server stapp03:<targetport>;
}

server {
    listen 80;
    server_name <targetlbr>;

    location / {
        proxy_pass http://app_backend;

        # Pass useful headers to the backend
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
- [restart]
```bash
sudo systemctl restart nginx
```

# [Edges]
- Edge: page does not load
- Fix: after the http block upstream restart the service
```bash 
sudo systemctl restart nginx
```
# [Status: Success]
- Notes:


