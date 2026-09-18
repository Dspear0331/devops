

# Date: 2026-09-14
---
# [Goal]
The Nautilus development team has provided requirements to the DevOps team for a new application development project, specifically requesting the establishment of a Git repository. Follow the instructions below to create the Git repository on the Storage server in the Stratos DC:


    Utilize yum to install the git package on the Storage Server.

    Create a bare repository named /opt/games.git (ensure exact name usage).



# [Pseudocode]
- install
- create git repo server 

# [To-Do-List]

- [intall git]
```bash
sudo yum install -y git
```
- [bare git]
```bash
git init --bare /opt/games.git
```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success / Failure]
- Notes:Bash

# On the server

git init --bare my_project.git

# On your laptop
this was copied from kodekloud

git remote add production user@ip:/path/to/my_project.git

git push production master

Key Points & Execution:

    Bare vs Normal: A "Bare" repo doesn't have a working directory; it is only used for storing the version history.

    Hooks: You can use "Git Hooks" to automatically restart your app whenever a push is received.

Expected Outcome: Your code will be transferred from your local machine to the server securely via Git
