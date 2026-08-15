# Date: 2026-08-10
---
# [Goal]
Switching to a RHEL-based distribution (AlmaLinux) and setting up essential services and security hardening.

---

# [Pseudocode]
- Download and install AlmaLinux.
- Install and configure OpenSSH server for remote management.
- Open SSH ports in firewalld.
- Create a restricted service account (`deploy_bot`) without interactive login shell access.
- Install and configure SELinux for security hardening (Enforcing mode).
- Troubleshoot SSH connection attempts using system logs.

---

# [To-Do-List]

- Install & Configure SSH
```bash
#Update repository metadata and install OpenSSH server
sudo dnf check-update && sudo dnf install openssh-server -y

#Enable and start SSH service in one command (--now starts it immediately)
sudo systemctl enable --now sshd

#Verify service status
sudo systemctl status sshd
```

- Firewall Configuration
```bash
- Allow SSH service permanently through firewalld
sudo firewall-cmd --permanent --add-service=ssh
#Reload firewall rules to apply changes
sudo firewall-cmd --reload
```
- User Mangement
```bash
# Add a dedicated service user with no interactive login shell
sudo useradd -s /sbin/nologin deploy_bot
# Verify user creation and assigned shell
grep deploy_bot /etc/passwd
```

- SELinux Security Hardening
```bash
# Ensure targeted policy is installed
sudo dnf update -y && sudo dnf install selinux-policy-targeted -y

# Check current SELinux status
getenforce
sestatus

#Temporarily switch modes (runtime)
sudo setenforce 0    # Permissive (log only, do not block)
sudo setenforce 1    # Enforcing (block unauthorized actions)

#Make Enforcing permanent across reboots
sudo vi /etc/selinux/config
# Edit line to: SELINUX=enforcing
```
#  
# [Edges] 
* Edge: VS Code Remote-SSH connection failure due to username syntax.
- Cause: Pasting ssh username@server_ip into the VS Code connection prompt causes VS Code to treat ssh username as the literal username parameter. The server sees an incoming request for a non-existent user named ssh username.

Fix: Input only username@server_ip in the VS Code prompt (omit the leading ssh).

Diagnostic Command:
```bash
# Stream live SSH logs to catch malformed username connection requests
sudo journalctl -u sshd -f
```
# [Status: Success]
- AlmaLinux comes with SELinux pre-installed and set to Enforcing by default.
- systemctl enable --now sshd eliminates the need for a separate systemctl start command.

