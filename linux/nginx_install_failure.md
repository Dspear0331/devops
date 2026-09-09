

# Date: 2026-09-08
---
# [Goal]
The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:


1. Install and configure nginx on App Server 3.

2. On App Server 3 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.

3. Create an index.html file with content Welcome! under Nginx document root.

4. For final testing try to access the App Server 3 link (via hostname) from jump host using curl command. For example: curl -Ik https://<app-server-name>/.


# [Pseudocode]


# [To-Do-List]
- []
    ```bash
    sudo cp /tmp/natilus.crt /etc/ssl/certs/ && chmod 644 /etc/ssl/certs/natilus.crt && sudo cp /tmp/natilus.key /etc/pki/tls/private/ && sudo chmod 600 /etc/pki/tls/private/natilus.key
    ```
- []
```bash
sudo nginx -t
```
- []
 sudo sh -c 'rm index.html && sudo echo "welcome!" > index.html'

sudo 
curl -ik https://stapp03/
# [Edges]
Edge: []
fix: []

# [Status:Failure]
- Notes: time failure i think it was because of a misconfiguration of the .conf 
