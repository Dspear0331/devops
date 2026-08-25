# Date: 2026-08-16
---
# [Goal]
Install,add host,and test ansible to ensure all users can use ansible system-wide

# [Pseudocode]
install ansible
test connection 

# [To-Do-List]
- install ansible
    ```bash
    #or make it avalible to everyone using pip3
    sudo pip3 install ansible==4.1.0 --break-system-packages
    ```
- add host
    ```bash
    echo "localhost ansible_connection=local" | sudo tee -a /etc/ansible/hosts 
    ```
- test connection to all host
    ```bash
    ansible all -m ping
    ```
- Edit /etc/ansible/hosts to group your servers by function  
# [Edges]
- Edge:If installing via pip or on a fresh modern distro, /etc/ansible/ might not exist yet. Running tee -a /etc/ansible/hosts will fail if the directory is missing.

- fix: 
    ```bash
    sudo mkdir -p /etc/ansible
    ```
-Edge:- Pinging remote IPs (192.168.x.x) via Ansible requires passwordless SSH or an explicitly passed password/key flag. 
- fix 
    ```bash
        ssh-copy-id user@192.168.x.x 
    ```
# [Status: Success]
- Notes: Package managers like apt or dnf rarely support installing a specific Python-style version like ansible-4.1.0. Running sudo apt-get install ansible-4.1.0 will likely give a "package not found" error.
i.e 
```bash    
        #REHL both are correct older version use yum
        sudo dnf makecache && sudo dnf install ansible-4.1.0 -y
        sudo yum makecache && sudo yum install ansible-4.1.0 -y
        #ubutu
        sudo apt-get update && sudo apt-get install ansible-4.1.0 -y
```
- to set up ansibles to remote servers /etc/ansible/hosts will be a list of ip 192.168.x.x and add as many needed for the network
- to give an individual the ability to access the ansible command
```bash
pip3 install --user ansible==4.1.0 
```

