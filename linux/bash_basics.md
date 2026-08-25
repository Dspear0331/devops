# Date: 2026-08-17
---
# [Goal]


# [Pseudocode]


# [To-Do-List]
- []
    ```bash
    #shbang must be the first line of the code 
    #!/bin/bash
    THRESHOLD=90
    #df=disk free awk=reads output line by line '{ print $5 }'=this is the awk argument which returns only what is in the fifth column
    # sed=serach,find,replace,instert,or delete s=subsitute the %. / before % and / before / is an escape character g= globaly 
    USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
    if [ $USAGE -gt $THRESHOLD ]; then
    echo "Disk space is critical!"
    fi
    ```


# [Edges]
Edge: []
fix: []

# [Status: Success / Failure]
- Notes:
