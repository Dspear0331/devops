# Date: 2026-09-13
---
# [Goal]
We need to setup a database server on Nautilus DB Server in Stratos Datacenter. Please perform the below given steps on DB Server:


a. Install/Configure MariaDB server.

b. Create a database named \<redacted\>.

c. Create a user called \<redacted\> and set its password to \<redacted\>.

d. Grant full permissions to user \<redacted\> on database \<redacted\>.


# [Pseudocode]
- install 
- enable
- create db 
- ensure db created
- creat user 
- grant privileges 
- test

# [To-Do-List]
- [enable db]
```bash
sudo dnf install -y mariadb-server
sudo systemctl enable --now mariadb
sudo systemctl status mariadb
```

- [create db]
```bash
#loging as root 
sudo mysql -u root
#create 
CREATE DATABASE <database_name>;
#check
SHOW DATABASES;
```
- [create user]
```bash
CREATE USER '<username>'@'localhost' IDENTIFIED BY '<password>';
```
- [privileges]
```bash
GRANT ALL PRIVILEGES ON <database>.* TO '<username>'@'localhost';
#reload permissions
FLUSH PRIVILEGES;
EXIT;
```
- [test]
```bash
#login
mysql -u <username> -p
#confirm privileges
SHOW DATABASES;
```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success]
- Notes: I am sure there will be many edge cases when I do this more other then remebering Caps in maria-shell for maria commands and ending with ; is very important the shell will assume it is a multi-line command so command will not run 
