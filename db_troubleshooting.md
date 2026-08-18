# Date: 2026-08-16
---
# [Goal]
Check the system unit status and deep-dive into the error logs provided by the database engine.

# [Pseudocode]


# [To-Do-List]
- [check status]
    ```bash
    systemctl status mariadb
    ```
- [View the last 50 lines of the error log]
    ```bash
    sudo tail -n 50 /var/log/mysql/error.log
    ```

# [Edges]
Edge: log file is empty
fix: journalctl -u mariadb

# [Status: Success]
- Notes: Common Culprits: Check for "Disk Full," "Permission Denied," or "Port 3306 already in use."

# Date: 2026-08-16
---
# [Goal]
There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.

Look into the issue and fix the same.


# [Pseudocode]
status 
identify problem 
fix
check
# [To-Do-List]
- check status
    ```bash
    - [check status]
    ```bash
    systemctl status mariadb
    ```
- system was dead 
    ```bash
    sudo mariadb-install-db --user=mysql --basedir=/usr --datafdir=/var/lib/mysql 
    ```
- start the servie
    ```bash
    sudo systemctl start mariadb
    ```

# [Edges]
Edge: []
fix: []

# [Status: Success]
-sudo journal -u mariadb worked because there is no dir /var/log/mysql/error.log
