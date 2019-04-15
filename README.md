# SSH Untils

## Requirements
1. Openssh  

## Features
1. Ultra fast login  
2. Easy use management script for adding/deleting hosts  

## HowTo
* **login.sh**  
Login a remote host, if a command is specified, it will run the command once on remote host  
```bash
bash login.sh [command]
```
* **ftp_ssh.sh**
Upload or download a file from server
```bash
bash ftp_ssh.sh (d | u) SourceFile Destination
```
* **add_ssh.sh**  
Add a ssh configuration  
```bash
bash add_ssh.sh
```  
* **mod_ssh.sh**  
Delete or change a configuration
```bash
bash mod_ssh.sh
```
* **clean_ssh.sh**  
Delete all known_hosts in ~/.ssh/known_hosts
```bash
bash clean_ssh.sh
```

## License
[GPLv3](https://www.gnu.org/licenses/gpl-3.0.txt)
