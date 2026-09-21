# Date: 2026-09-20
---
# [Goal]
The xFusionCorp development team added updates to the project that is maintained under /opt/apps.git repo and cloned under /usr/src/kodekloudrepos/apps. Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, so we need to update remote on /usr/src/kodekloudrepos/apps repository as per details mentioned below:

a. In /usr/src/kodekloudrepos/apps repo add a new remote dev_apps and point it to /opt/xfusioncorp_apps.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.


# [Pseudocode]
- cd dir
- add remote repo
- cp file
- add commit push

# [To-Do-List]

- [cd to apps dir]
```bash
cd /usr/src/kodekloudrepos/apps
```

- [create remote link]
```bash
sudo git remote add dev_apps /opt/xfusioncorp_apps.git
```

-[cp to git repo]
```bash
sudo cp /tmp/index.html .
```

- [stage,commit,push to remote]
```bash
sudo git add .
sudo git commit -m "..."
sudo git push dev_apps master
```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success]
- Notes:
