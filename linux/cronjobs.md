# Date: 2026-08-15
---
# [Goal]
Create a cron job with root permission and executes every 5 minutes

# [Pseudocode]
- install start enable crond
- open cron editor in root 
- run a script every 5 min

# [To-Do-List]
- [install cron] 
    ```bash
    sudo yum install cronie -y
    ```
- [open cron editor]
    ```bash
    #open as logged in user
    crontab -e
    #opens editor in root 
    sudo crontab -e
    ```
- [run a script every five minutes]
    | Field | value | Description |
    | :--- | :--- | :--- |
    | **minute** | '0 to 59' | min |
    | **hour** | '0 to 23' | 24hr clock |
    | **day of month** | '1 to 31' | days |
    | **day of week** | '0 to 6' | '0' is sunday |
    | **month** | '1 to 12' | or Jan to Dec |
    | **\*** | 'every' | minute,hour,day of the month,day of the week(in order of how linux will read) |
    | **/** | '*/5'(every 5 units) | step value  |
    | **,** | '1,15,30'(every 1,15,30) | lists |
    | **-** | '1-5'(only 1 through 5) | range |

    ```bash
    #every 5 minutes every hour every day of the month every month everyday of the week
    */5 * * * * echo hello > /tmp/cron_text
- check if cron exsist
    ```bash
    crontab -l
    #if cron is root need to check as root 
    sudo crontab -l
    ```

# [Edges]
- Edge: when you install cronie the service is not activate nor enabled
- Fix: 
```bash
    sudo systemctl start crond
    sudo systemctl enable crond
```
*best if done as soon as cronie is installed*
```bash 
sudo yum install cronie -y && sudo systemctl start crond && sudo systemctl enable crond
``` 
# [Status: Success]
- Notes: This was straight foward just need to remeber that the service is not started imeditatly 
