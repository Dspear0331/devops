# Date: 2026-09-20
---
# [Goal]
The Nautilus application development team has been working on a project repository /opt/apps.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:


Create a new branch datacenter in /usr/src/kodekloudrepos/apps repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.


# [Pseudocode]
- cd repo
- add branch
- cp file
- push orgin
- stage 
- commit
- chg branch to master
- merge
- push origin

# [To-Do-List]

- [cd to git repo]
```bash
cd /usr/src/kodekloudrepos/apps
```
- [create branch]
```bash
sudo git switch -c datacenter
```

- [cp file]
```bash
sudo cp /tmp/index.html .
```

-[stage push merge push]
```bash
sudo git add .
sudo git commit -m "added index.html"
sudo git push origin -u datacenter
sudo git checkout master
sudo git merge datacenter
sudo git push origin master
```

# [Edges]
- Edge: dobies login 
- Fix: sudo or chmod -R natasha:natasha /opt/apps.git although these can cause file permission errors when checking out files 
```bash 
git config --global --add safe.directory <file/path/to/repo/>
```


# [Status: Success]
- Notes: make sure to push origin for the remote server gets updated with the current local repo. when you are setting up a repo ensure proper ownership and privileges are key
