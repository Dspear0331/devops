# Date: 2026-08-15
---
# [Goal]
 Generate an RSA key pair and copy the public key to the "Authorized Keys" file of the target server

# [Pseudocode]
- generate keys
- copy key to server
- 

# [To-Do-List]
- Generate keys 
    ```bash
    #press enter for all prompts
    ssh-keygen -t rsa
    # -t flag (type)
    # rsa is a key format 
    #best practice is use to ed25519 faster shorter more secure keys
    ssh-keygen -t ed25519
    ```


# [Edges]
- Edge: In the lab in did not show how to push the new key to the target server
- fix:  push to user on target server
```bash
ssh-copy-id <username>@<remote_server_ip>
```
- Edge: don't use windows. seriously on minimum or window ssh-copy-id will not work

- fix: manual push
```bash
cat ~/.ssh/id_ed25519.pub | ssh username@remote_host "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

# [Status: Success]
- Notes: Keep private keys i.e id_rsa secret. Only share your public keys i.e id_rsa.pub When using -t ed25519, the resulting key filenames will be id_ed25519 (private) and id_ed25519.pub

- ssh-copy-id appends the public key into ~/.ssh/authorized_keys on the remote server for the specified user.

- when using ssh-keygen pressing enter on all prompts can be less secure and Setting a passphrase encrypts the private key at rest on your local disk. If your laptop/machine is stolen or compromised, the attacker still cannot use your SSH key without the passphrase.

