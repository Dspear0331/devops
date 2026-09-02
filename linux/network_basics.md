# Date: 2026-08-31
---
# [Goal]


# [Pseudocode]
linsten to network

# [To-Do-List]
- [linsten to network]
    ```bash
    sudo ss -tulpn
    ```
| flag | meaning |
| :--- | :--- |
| -t | tcp |
| -u | udp |
| -l | listening |
| -p | process |
| -n | mumeric ports |

- [Example]
```bash
#this will listen for  all the ports give an detail report with a timestamp and push to a file 
{date; sudo ss -tulpn | grep -E '22|80';} >> filename.txt
```
#lab dose not have http open but layout will be simialar to this
![alt text](linux_ss.md)
# [Edges]
Edge: []
fix: []

# [Status: Success / Failure]
- Notes:
