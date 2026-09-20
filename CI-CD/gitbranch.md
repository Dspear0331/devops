# Date: 2026-09-20
---
# [Goal]
Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/ecommerce. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:


    On Storage server in Stratos DC create a new branch xfusioncorp_ecommerce from master branch in /usr/src/kodekloudrepos/ecommerce git repo.

    Please do not try to make any changes in the code.



# [Pseudocode]
- change dir
- fetch repo 
- create branch
- ensure

# [To-Do-List]

- [switch to repo]
```bash
cd /usr/src/kodekloudrepos/ecommerce
git fetch
```

- [create and switch branch]
```bash
git switch -c xfusioncorp_ecommerce
```
- [check]
```bash 
git status
```

# [Edges]
- Edge: fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/ecommerce'
To add an exception for this directory, call:
- Fix: 
```bash
git config --global --add safe.directory /usr/src/kodekloudrepos/ecommerce
```
- Edge: error: cannot open '.git/FETCH_HEAD': Permission denied
- Fix: Change ownership
```bash
chown -R $(whoami) /usr/src/kodekloudrepos/ecommerce
```
or if able change permission for the rep 
with chmod

# [Status: Success]
- Notes:
