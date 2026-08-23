# Date: 2026-08-19
---
# [Goal]
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for archiving website content files. They have a static website running on App Server 2 in Stratos Datacenter, and they need to create a bash script named news_archive.sh which should accomplish the following tasks. (Also remember to place the script under the /scripts directory on App Server 2).


a. Create a zip archive named xfusioncorp_news.zip of /var/www/html/news directory.

b. Save the archive in the /archives/ directory on the App Server 2. This is a temporary storage, as archives from this location will be cleaned on a weekly basis. Therefore, the archive should also be copied to the Nautilus Storage Server so it can be retrieved later for validation purposes.

c. Copy the created archive to the Nautilus Storage Server  in the /archives/ location.

d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

e. Do not use sudo inside the script.

Note:
The zip package must be installed on given App Server before executing the script. This package is essential for creating the zip archive of the website files. Install it manually outside the script.


# [Pseudocode]
ssh to app server2
make sure zip is installed 
zip file 
cp file to storage server
make sure respected user can use script 
make it executeable
check to encsure succes
# [To-Do-List]
- [ssh to app app server2]
    ```bash
    ssh <username>@<hostname>
    ```
- [Ensure zip is installed]
    ```bash
    #check if zip is installed 
    zip --version || sudo yum install -y zip
    ```
- create ssh key
    ```bash
    #-N '' this is a shortcut to have keygen not prompt for passphrase
    ssh-keygen -t rsa -N ""
    ssh-copy-id <username>@<hostname>
    #verify
    ssh <username>@<hostname>
    ```
- write srcript
    - [zip and store]
        ```bash
        #You must include the -r flag for zip to archive #directories recursively, otherwise it will only #save empty directory header
        cd /var/www/html && zip -r /archives/xfusioncorp_news.zip news
        ```
    - scp to Nautilus Storage Server
        ```bash
        #push file to storage sever
        #scp <path/to/local_folder/or/dir_name> <username>@<hosname>:/path/to/destination/
        scp /archives/xfusioncorp_news.zip natasha@ststor01:/archives/       
        ```

- [make it executable]
    ```bash
    chmod +x /scripts/news_archive.sh
    ```

- [Ensure xfusioncorp_news.zip is on storage]
    ```bash
    ssh <username>@<hostname> 
    ls /archives
    ```
# [Edges]
Edge: in the lab it clearly states to save the script in /scripts as news_archive.sh the grader fails saying it should be beta_news_archive.sh
fix: name it beta_news_archive.sh
Edge:lab does not know ed25519 it requires rsa
Edge: Running zip on full absolute paths creates nested folders inside the archive (/var/www/html/news/...). Automated lab evaluation scripts often check for files directly relative to the news directory.
fix:cd /var/www/html && zip -r /archives/xfusioncorp_news.zip news

# [Status: Success]
- Notes:pay attention do not assume you know what the goal is. I kept trying to solve the lab but not reread what it was asking. Face Palm. Read Read Read 
