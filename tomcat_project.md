# Date: 2026-08-21
---
# [Goal]
The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:


a. Install tomcat server on App Server 2.

b. Configure it to run on port 8088.

c. There is a ROOT.war file on Jump host at location /tmp.

Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://<taget_host>:8088


# [Pseudocode]
- push ROOT.war to app server 2
- set-up firewall
- enable tomcat 
- test if tomcat is active

# [To-Do-List]
- [push .war]
```bash
#this pushes to <target_users> home dir must be moved to /webapps/ inside of tomcat
scp /tmp/ROOT.war <username>@<hostname>:
```
- [ssh to server application server 2]
```bash
ssh <username>@<hostname>
- [install firewalld and tomcat]
```bash
sudo dnf check-update && sudo dnf install tomcat firewalld  
```
- [set up firewall]
```bash
#ensure connections before start
sudo firewall-offline-cmd --zone=public --add-port=22/tcp --permanent
sudo firewall-offline-cmd --zone=public --add-port=8088/tcp --permanent
sudo systemctl enable --now firewalld
#Remove ssh but keep current session
sudo firewall-cmd --zone=public --remove-port=22/tcp --permanent
```

- [setup tomcat]
```bash
sudo systemctl start tomcat
#change to listening port
sudo vi /etc/tomcat/server.xml
#change uncommeted connector to 8088
#move .war file to tomcat
mv ROOT.war /var/lib/tomcat/webapps/
#change ownership
sudo chown tomcat:tomcat /var/lib/tomcat/webapps/ROOT.war
#restart
sudo systemctl restart tomcat
#test tomcat is listing 
sudo lsof -i :8088
#if ss or Isof is not installed
netstat -tuln
```
- [test]
```bash
curl http://<target_host>:8088
```

# [Edges]
- Edge: SSh drops when enabling firewall 
- Fix: run the firewall to allow port 22 to listen 
```bash 
sudo firewall-offline-cmd --zone=public --add-port=22/tcp
#restart service
sudo systemctl restart firewalld
```
- Edge: when sudo firewall-offline-cmd --zone=public --add-port=22/tcp is ran it requires a --permanent flag
but the lab did not state that ssh is allowed to be persistant in the firewall port allowance
- Fix:
```bash
# Remove port 22 from the permanent config in memory/disk while keeping current session alive
sudo firewall-cmd --zone=public --remove-port=22/tcp --permanent
```

# [Status: Success]
- Notes: In previous notes I stated the command was `sudo firewall-cmd --zone=public --add-port=22/tcp --permanent --offline`.
This throws an error because `--offline` is not a valid flag.
The correct command is:
```bash
sudo firewall-offline-cmd --zone=public --add-port=22/tcp --permanent
```
