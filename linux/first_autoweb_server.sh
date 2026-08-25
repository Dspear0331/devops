#!/bin/bash

# ecape if error 
set -e

if [ -z "$1" ]; then
    echo "Usage $0 <tomcat-port>"
    exit 1

fi
PORT="$1"

useradd -r -m -s /sbin/nologin server_bot
dnf install firewalld tomcat selinux-policy-targeted -y
#Ensure selinux enforcing after reboot
sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
#Ensure selinux is enforcing now
setenforce 1

#set-up firewall
firewall-offline-cmd --zone=public --add-port="${PORT}/tcp" --permanent
firewall-offline-cmd --zone=public --add-port=22/tcp --permanent
systemctl enable --now firewalld

#disable Root ssh access
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd
#setting port access
sed -i "s/port=\"8080\"/port=\"${PORT}\"/g" /etc/tomcat/server.xml
# set-up web-server
if [ -f /var/lib/tomcat/webapps/ROOT.war ]; then
    chown server_bot:server_bot /var/lib/tomcat/webapps/ROOT.war
fi
systemctl enable --now tomcat
