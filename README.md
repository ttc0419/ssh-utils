# SSH Utils
Bash scripts that let you manage you remote SSH servers in a more efficient way.


## Usage
**login.sh**  
Login a remote host, if a command is specified, it will run the command once on remote host  
```bash
./login.sh [command]
```

**transfer-file.sh**  
Upload or download a file from server
```bash
./transfer-file.sh (d | u) SourceFile Destination
```

**add-config.sh**  
Add a ssh configuration  
```bash
./add-config.sh
```

**delete-config.sh**  
Delete a configuration
```bash
./delete-config.sh
```

**clear-cache.sh**  
Delete all known_hosts in ~/.ssh/known_hosts
```bash
./clear-cache.sh
```


## License
[GPLv3](https://www.gnu.org/licenses/gpl-3.0.txt)
