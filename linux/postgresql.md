
# Date: 2026-09-11
---
# [Goal]
The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:


PostgreSQL database server is already installed on the Nautilus database server.

a. Create a database user \<redacted\> and set its password to \<redacted\>.

b. Create a database \<redacted\> and grant full permissions to user \<redacted\> on this database.

Note: Please do not try to restart PostgreSQL server service.


# [Pseudocode]
- start the psql shell
- add user
- create db
- connect to db
- grant privileges
- test
- quit

# [To-Do-List]
- [log into psql shell]
```bash
#postgres shell
sudo -u postgres psql 
```
- [create user and database]   
```bash
#inside the shell
Create User <username> WITH PASSWORD '<password>';
#create database
CREATE DATABASE <database_name>
```
- [connect]
```bash 
\c <database_name>
```
- [grant privileges]
```bash
    GRANT ALL PRIVILEGES ON DATABASE <databasename> TO <username>;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO <username>;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES to <username>;
```
- [check privileges]
```bash
    \du <username>
    \l 
    #look for c=connect t=create tmp tables c=create schemas
    #check for future table privalages
    \ddp
```
- [quit]
```bash
\q
```


# [Edges]
- Edge: command silently fails
- Fix: when running commands in psql remember to add a ; at the end of the command if it runs correctly you should see GRANT or ALTER after the command 
executes

# [Status: Success]
- Notes:This was annoying,because of the silient failures, it is very important 
