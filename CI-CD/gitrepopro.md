# [Goal]
The DevOps team established a new Git repository last week, which remains unused at present. However, the Nautilus application development team now requires a copy of this repository on the Storage Server in the Stratos DC. Follow the provided details to clone the repository:


The repository to be cloned is located at /opt/news.git

Clone this Git repository to the /usr/src/kodekloudrepos directory. Perform this task using the natasha user, and ensure that no modifications are made to the repository or existing directories, such as changing permissions or making unauthorized alterations.



# [Pseudocode]
- change dir
- clone repo

# [To-Do-List]

- [change dir]
```bash
cd /usr/src/kodekloudrepos
```
- [clone repo]
```bash
git clone /opt/news.git
```
# [Edges]
- Edge: '/opt/news.git' git repository is not cloned under '/usr/src/kodekloudrepos/' on Storage Server
- Fix: when running git clone /opt/news.git /usr/src/kodekloudrepos repo not found. git takes the repo name and creates a dir inside when you pass the command above it creates a dir /usr/src/kodekloudrepos/news.git instead of /news
```bash
git clone /opt/news.git /usr/src/kodekloudrepos/news.git
```
so in the lab the above method did not work? had to cd into the dir(lab constraint)
```bash
cd /usr/src/kodekloudrepos/news.git
git clone /opt/news.git
```
# [Status: Success]
- Notes: test fix in a live server to test git clone /opt/news.git /usr/src/kodekloudrepos 
Git rejects cloning into a non-empty directory unless you target a specific subfolder or name
