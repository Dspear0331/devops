# Date: 2026-09-21
---
# [Goal]
The Nautilus application development team has been working on a project repository /opt/official.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:


There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.


# [Pseudocode]
- cd
- check log 
- switch to master
- cherry pick
- push

# [To-Do-List]

- [cd]
```bash
cd usr/src/kodekloudrepos/official
```
- [check log]
```bash
sudo git log --oneline
```
- [switch to main]
```bash 
sudo git switch master
```

- [cherry pick]
```bash
sudo git cherry-pick <git commit hash>
```

- [push]
```bash
sudo git push origin master
```

# [Edges]
- Edge: []
- Fix: []

# [Status: Success]
- Notes:
