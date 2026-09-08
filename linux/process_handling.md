

# Date: 2026-09-02
---
# [Goal]
The production support team of xFusionCorp Industries has deployed some of the latest monitoring tools to keep an eye on every service, application, etc. running on the systems. One of the monitoring systems reported about Apache service unavailability on one of the app servers in Stratos DC.


Identify the faulty app host and fix the issue. Make sure Apache service is up and running on all app hosts. They might not have hosted any code yet on these servers, so you don't need to worry if Apache isn't serving any pages. Just make sure the service is up and running. Also, make sure Apache is running on port 8088 on all app servers.


# [Pseudocode]
- ssh each server 
- check if apache is running
- check ports 
- check firewall 
- check proccess 

# [To-Do-List]
- [ssh]
```bash
ssh <serverip>@<hostip>
```
- [check service]
```bash
 sudo systemctl status httpd
 ```
 came back not active failed procces binding on port
 fix 
 ```bash 
#see what is binding the port
sudo ss -tulpn | grep 8088
#kill binded proccess gracefully
sudo kill -15 <pid>
#restart service apache
sudo systemctl restart httpd
```
- [server 2]
```bash
sudo systemctl status httpd
```
Active 
- [server 3]
```bash
sudo systemctl status httpd
```

# [Edges]
Edge: []
fix: []

# [Status: Success / Failure]
Notes:
| command | output |
| :--- | :--- | 
| top | list of procces and pid(personal identification ) numbers |
| kill | stops proccess via pid or process name |
| kill -15 \<pid\>| SIGTERM softly halts process and dependices should be first attempt |
| kill -9 \<pid\> | SIGKILL abrubtly stops proccess and not dependicies can cause state and data corrupiton for that instant |
