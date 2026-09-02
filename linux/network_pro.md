# Date: 2026-09-01
---
# [Goal]
Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 3000 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.


Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.

Once fixed, you can test the same using command curl http://stapp02:3000 command from jump host.

Note: Please do not try to alter the existing index.html code, as it will lead to task failure.


# [Pseudocode]
- verify local network binding
- is service running
- test local tcp reachability
- check auto start config
- verify fiwalls rules 
- apply and verify

# [To-Do-List]
- [local binding]
```bash
ss -tunlp | grep -E '3000'
```
- [is service running]
``bash
sudo sytemctl status httpd
```
- [testing tcp reachability]
```bash
#local test
sudo telnet 127.0.0.1 3000
#Net test
sudo telnet <host_ip> 3000
```
- problem found 
- fix 
```bash
sudo vi /etc/httpd/conf/httpd.conf
``` 
- [found that the service was not set to persistant and service was not restarted]
```bash
sudo systemctl enable --now httpd
```
# [Edges]
Edge: []
fix: []

# [Status: Success]
- Notes: another lab was iptables was not set to allow 3003
```bash
#this is how to allow a port using iptables
sudo iptables -A INPUT -p tcp --dport 3003 -j ACCEPT
#save table
sudo service iptables save
#restart iptables service
sudo systemctl restart iptables 
```
- Found this following the same steps just found when i did telnet from the server ip it worked but when 
```bash
curl http://<hostip>:3003 
```
- checked to see if their where anything binded to port 3003
```bash 
ss -tunlp | grep 3003
```
- it would come back with no response meaning the port was free and not listing

- another lab showed when trying to active apache that anoter service was currently binded 
```bash
lsof -i
```
- returned mailserver which was the wrong port
```bash
#killed the rouge  process 
kill -9 <pid>
```



| `ss -tunlp \| grep <port>` Output | Diagnostic Meaning | Next Action |
| :--- | :--- | :--- |
| **No output** | Port is free / nothing listening | Start httpd or update config port |
| **`httpd` listed** | Apache is bound and active locally | If remote fails, inspect iptables / firewalld |
| **Other process listed** | Port collision | Stop process or clear PID (`lsof -i :<port>`) |

- note iptables are installed but default but ui is not
- fix:
```bash
# if iptables comes back command not found  
sudo dnf install iptables iptables-services -y
``` 
