# Date: 2026-09-20
---
# [Goal]

Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/beta. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:


    On Storage server in Stratos DC create a new branch xfusioncorp_beta from master branch in /usr/src/kodekloudrepos/beta git repo.

    Please do not try to make any changes in the code.

 
# [Pseudocode]


# [To-Do-List]

- []
```bash

```
- []
```bash

```
# [Edges]
- Edge: []
- Fix: []

# [Status: Success / Failure]
- Notes:When starting a new feature or fixing a bug. Working in a branch keeps your experimental code separate from the stable "main" code, allowing multiple people to work on different things simultaneously.

How to do this:

Use the checkout command with the -b flag or the newer switch command.

The Commands:

 Bash

git checkout -b feature-web-login

# OR

git switch -c feature-web-login

Naming: Use descriptive names (e.g., bugfix-header or feature-api).

Expected Outcome:Git moves you to a new workspace where changes won't affect the main branch.  
