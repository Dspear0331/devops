# Date: 2026-09-01
---
# [Goal]
We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 5004 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:


1. Install iptables and all its dependencies on each app host.

2. Block incoming port 5004 on all apps for everyone except for LBR host.

3. Make sure the rules remain, even after system reboot.


# [Pseudocode]
install iptables
block incoming port 5004 exp lbr
ensure persestants
# [To-Do-List]
- [install iptables services]
```bash
   sudo dnf install iptables iptables-services -y 
```
- [allow lbr deny everything else]
```bash
hostname - I
sudo iptables -A INPUT -p tcp -s <stlb01> --dport 5004 -j ACCEPT
#deny everyone else
sudo iptables -A INPUT -p tcp --dport 5004 -j DROP
#save
sudo iptables-save | sudo tee /etc/sysconfig/iptables
#check 
sudo iptables -L INPUT -v -n --line-numbers
```
# [Edges]
- Edge: spelling
- Fix: always check spelling
# [Status: Success]
- Notes:
best way to perform this task
```bash
sudo dnf install iptables iptables-services -y &&\
sudo iptables -A INPUT -p tcp -s stlb01 --dport 5004 -j ACCEPT &&\
sudo iptables -A INPUT -p tcp --dport 5004 -j DROP &&\
sudo iptables-save | sudo tee /etc/sysconfig/iptables &&\
sudo systemctl enable --now iptables
```
