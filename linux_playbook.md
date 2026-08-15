# Goal
## Note this breaks my format but this is good basics but for a more in depth between the distro i will conitinue through rehl.md and ubuntu.md

Document Linux administration, account management, SSH hardening, and Mandatory Access Control (MAC) using AppArmor (Ubuntu) and SELinux (RHEL/Rocky).

# Pseudocode
- Configure non-interactive service accounts and set account expiration limits.
- Disable direct root login over SSH and restart `sshd` service.
- Set up executable permissions and shebang lines for scripts.
- Apply mandatory access control (MAC) policies:
    - If OS is Ubuntu/Debian:
        - Manage AppArmor profile modes (`aa-complain` / `aa-enforce`).
    - If OS is RHEL/Rocky:
        - Manage SELinux operational states (`setenforce 0` / `setenforce 1` or edit `/etc/selinux/config`).

# To-Do-List
- Configure non-interactive service account
    ```bash
    sudo useradd -s /sbin/nologin deploy_bot
    grep deploy_bot /etc/passwd
    ```

- Set and check user account expiration
    ```bash
    sudo useradd -e YYYY-MM-DD <username>
    sudo chage -l <username>
    ```

- Harden SSH access by disabling root login
    ```bash
    # Set 'PermitRootLogin no' inside /etc/ssh/sshd_config
    sudo nano /etc/ssh/sshd_config
    sudo systemctl restart sshd
    ```

- Configure script execution permissions
    ```bash
    chmod +x script.sh
    ./script.sh
    ```

- Configure AppArmor on Ubuntu/Debian
    ```bash
    sudo apt update && sudo apt install apparmor apparmor-utils -y
    sudo aa-status
    sudo aa-complain /path/to/binary   # Permissive/Complain mode
    sudo aa-enforce /path/to/binary    # Active Enforce mode
    ```

- Configure SELinux on RHEL/Rocky Linux
    ```bash
    sudo dnf update && sudo dnf install selinux-policy-targeted -y
    sestatus
    sudo setenforce 0                   # Permissive mode (temporary)
    sudo setenforce 1                   # Enforcing mode (temporary)
    # Set SELINUX=enforcing inside /etc/selinux/config for permanent enforcement
    ```

# Edges
Edge: [Running a script without execution permissions causes a 'Permission denied' error.]
fix: [Run `chmod +x script.sh` before invoking `./script.sh`.]

Edge: [Executing `setenforce 2` or trying to use `setenforce` to disable SELinux completely.]
fix: [Use `setenforce 0` for Permissive and `1` for Enforcing. To completely disable SELinux, set `SELINUX=disabled` in `/etc/selinux/config` and reboot.]

Edge: [Incorrect SSH connection syntax using hostname instead of user.]
fix: [Use `ssh <username>@<ip_of_server>` instead of `ssh <hostname>@<ip_of_server>`.]

Edge: [Running `useradd` to inspect user expiration parameters instead of `chage`.]
fix: [Use `sudo chage -l <username>` to view detailed expiration dates.]

# Status: Success / Failure
- Notes: Success.
  * Verified SSH security adjustments prevent remote root access.
  * Mapped differences between Ubuntu's profile-based AppArmor and RHEL's system-wide SELinux architecture.
  * Fixed command typos (`systemctrl` -> `systemctl`, `sentforce` -> `setenforce`).
