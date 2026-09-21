# Date: 2026-09-20
---
# [Goal]
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/official present on Storage server in Stratos DC. However, they reported an issue with the recent commits being pushed to this repo. They have asked the DevOps team to revert repo HEAD to last commit. Below are more details about the task:

    In /usr/src/kodekloudrepos/official git repository, revert the latest commit ( HEAD ) to the previous commit (JFYI the previous commit hash should be with initial commit message ).

    Use revert official message (please use all small letters for commit message) for the new revert commit.



# [Pseudocode]
- cd dir
- find revert commit id
- revert

# [To-Do-List]

- [cd dir]
```bash
cd /usr/src/kodekloudrepos/official
```
- [find repo log id]
```bash
sudo git log --oneline
```

- [revert]
```bash
#-n no commit
sudo git revert -n <commit hash>
sudo git commit -m "revert official message"
```

# [Edges]
- Edge: []
- Fix: []

# [Status: Success]
- Notes:   
