# Date: 2026-08-21
---
# [Goal]
intstall Tomcat(Tomcat is used when you need to host java base task)


# [Pseudocode]
- install JDK(java developement kit)
- install apache-tomcat
- unpack tarball(tarball is like zipping a multiple files together for easier shipping)
- ensure port 8080 is allowed 
- start webserver

# [To-Do-List]
- [install JDK]
    ```bash
    #update repo and install jdk
    sudo yum check-update
    sudo yum install java-17-openjdk-devel -y
    #verify
    java --version
    ```
- [install tomcat]
    - using curl
        ```bash
        #-O uses it original filename when installing 
        curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz
        ```

    - using wget
        ```bash
        wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz
        ```
- [Extract tarball]
    ```bash
     tar -xvf apache-tomcat-*.tar.gz
    ```
    flags (x) extract (v) verbose (f) file

- [allow firewall to allow default tomcat port 8080 firewalld]
    ```bash
    #ensure ssh is not blocked when enabled 
    sudo firewall-cmd --zone=public --add-port=22/tcp --permanent 
    #permanently open 8080 persistant even after reboot 
    sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent --offline               
    #Enable now and on reboot 
    sudo systemctl enable --now firewalld
    ```
- [allow firewall to allow default tomcat port 8080 ufw]
    ```bash
    #check status and enable  
    sudo ufw status verbose
    sudo ufw allow 8080/tcp
    sudo ufw enable
    ```
- [After installing the JDK, Tomcat often requires JAVA_HOME to be explicitly defined in your environment variables]
    - best for tarballs
        - Create a export script in profile.d
        ```bash
        echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk' | sudo tee /etc/profile.d/java.sh
        echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/java.sh
        ```
        - Make it executable
        ```bash
        sudo chmod +x /etc/profile.d/java.sh
        ```
        - Load it into your current session immediately
        ```bash
        source /etc/profile.d/java.sh
        ```
    - Inside Systemd (Best for Production/Ephemeral Services)
        ```bash
        /etc/systemd/system/tomcat.service
        #Service
        Environment="JAVA_HOME=/usr/lib/jvm/java-17-openjdk"
        ```
    - Best for Portability
        # Create setenv.sh in Tomcat's bin directory
        ```bash
        echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk' | sudo tee /opt/tomcat/bin/setenv.sh
        sudo chmod +x /opt/tomcat/bin/setenv.sh
        ```

- [start webserver Tomcat]
```bash
./bin/startup.sh
```
- [ Verify Java is actively listening on port 8080]
```bash
sudo ss -tulnp | grep 8080
```
- [ Test local HTTP response from Tomcat]
```bash
curl -I http://localhost:8080
```

# [Edges]
Edge: Automating using curl or wget for this is slower and less secure
Fix:use packet manager  yum.dnf,apt-get
```bash
    #latest vesion of tomcat
    sudo dnf install tomcat -y
    #if you need a specific version
    #check if repo contains version
    sudo dnf list tomcat --showduplicates
    #install version example
    sudo dnf install tomcat-9.0.80-1.el9 -y
    #check if install was successful
    dnf info tomcat
```
Edge: activating firewall closes ssh connections
Fix: by default ssh is port 22 so ensure it is allow before activating the firewall if not activated already
```bash
    #ufw 
    sudo ufw allow 22/tcp
    #firewalld
    sudo firewall-cmd --zone=public --add-port=22/tcp
```
- Edge: ./bin/startup.sh assumes your are already sitting on the home dir of Tomcat
- Fix: 
    - tarball
        ```bash
        cd apache-tomcat-10.1.25/bin && ./startup.sh
        ```
    - package manager
        sudo systemctl enable --now tomcat

# [Status: Success / Failure]
- Notes: 
    - when using repo manager unpacking a tarball is not needed 
    - when using ufw default state is permanent
    - ALLOW ENABLE this is the path used to setting up firewalls allow ports enable firewall 
    - firewalld --offline flag is needed to work with the service not running
    - temporarlily open a port 8080 lost on reboot can not use --offline flag must be permanent
        ```bash
        sudo firewall-cmd --zone=public --add-port=8080/tcp
        ```
    - check firewall state and status
        ```bash 
        sudo firewall-cmd --state
        sudo firewall-cmd --get-active-zones
        ```
    - list currently allowed ports
        ```bash 
        sudo firewall-cmd --list-all
        ```
    - Restart firewall if already running
    sudo firewall-cmd --reload  
