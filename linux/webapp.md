# Date: 2026-09-13
---
# [Goal]
xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:


a. Install httpd package and dependencies on app server 1.

b. Apache should serve on port 6000.

c. There are two website's backups /home/thor/official and /home/thor/cluster on jump_host. Set them up on Apache in a way that official should work on the link http://localhost:6000/official/ and cluster should work on link http://localhost:6000/cluster/ on the mentioned app server.

d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:6000/official/ and curl http://localhost:6000/cluster/


# [Pseudocode]


# [To-Do-List]
- [push files]
```bash
   #mv files to home of the app01 server
    scp -r cluster official <username>@<hostname>:
```

- [install and confiqure]
```bash
sudo dnf install -y httpd
sudo vi /etc/httpd/conf/httpd.conf
```
change listening to 6000

- [start service]
```bash
sudo systemctl enable --now httpd
```

- [cp files to correct path]
```bash
sudo cp -r cluster official /var/www/html
```
 Remove the default index.html created by Apache
```bash
 sudo rm -f /var/www/html/index.html
```

- [restart service]
```bash
sudo systemctl restart httpd
```

# [Edges]
- Edge: Using scp -r cluster official \<username\>@\<appserver\>:/var/www/html/ coming back as file not found 
- Fix: push to home dir user does not have permission to acces /var/www/html/ or change ownership of the dir
```bash
sudo chown -R apache:apache /var/www/html
sudo usermod -aG apache tony
sudo chmod -R 775 /var/www/html
```
Permissions: Directories usually need 755 and files need 644.

# [Status: Success]
- Notes:
