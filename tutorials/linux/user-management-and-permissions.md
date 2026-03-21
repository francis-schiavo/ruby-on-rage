# User Management and Permissions

## User Accounts

### Types of Users
- **Root**: Superuser with full system access (UID 0)
- **System Users**: For services and daemons (UID 1-999)
- **Regular Users**: Normal users (UID 1000+)

### Adding Users
```bash
sudo adduser username
```
Creates a new user with home directory and default settings.

### Deleting Users
```bash
sudo deluser username
```
Removes a user but keeps home directory.

```bash
sudo deluser --remove-home username
```
Removes user and home directory.

### Modifying Users
```bash
sudo usermod -l new_username old_username  # Change username
sudo usermod -d /new/home username          # Change home directory
sudo usermod -aG group username             # Add to group
```

## Groups

### Managing Groups
```bash
sudo addgroup groupname     # Create group
sudo delgroup groupname     # Delete group
sudo adduser username group # Add user to group
```

### Useful Groups
- `sudo`: Allows use of sudo command
- `adm`: System monitoring
- `www-data`: Web server files
- `docker`: Docker access

## Password Management

### Changing Passwords
```bash
passwd                    # Change own password
sudo passwd username      # Change other user's password
```

### Password Policies
Configure in `/etc/login.defs`:
- Minimum password length
- Password aging
- Account expiration

## sudo Configuration

### sudoers File
Located at `/etc/sudoers`

Edit with `sudo visudo` (safe editing)

Example entries:
```
username ALL=(ALL:ALL) ALL          # Full sudo access
username ALL=(ALL:ALL) NOPASSWD:ALL # No password required
%group ALL=(ALL:ALL) ALL            # Group sudo access
```

### sudo Commands
```bash
sudo command              # Run command as root
sudo -u username command  # Run as specific user
sudo -i                   # Start root shell
```

## File Permissions (Review)

### Understanding Permissions
- Read (r): 4
- Write (w): 2
- Execute (x): 1

For files: rw- r-- r--
For directories: rwx r-x r-x

### Changing Permissions
```bash
chmod 755 file          # rwxr-xr-x
chmod u+x file          # Add execute to owner
chmod g-w file          # Remove write from group
chmod o=r file          # Set others to read only
```

### Changing Ownership
```bash
chown user:group file
chown -R user:group dir  # Recursive
```

### Special Permissions
- **Setuid (s)**: `chmod u+s file` - Execute as file owner
- **Setgid (s)**: `chmod g+s dir` - New files inherit group
- **Sticky bit (t)**: `chmod +t dir` - Only owner can delete files

## Access Control Lists (ACLs)

### Installing ACL Support
```bash
sudo apt install acl
```

### Managing ACLs
```bash
getfacl file              # View ACLs
setfacl -m u:user:rw file # Set ACL
setfacl -x u:user file    # Remove ACL
```

## Security Best Practices

1. **Use sudo instead of root**: Avoid logging in as root
2. **Strong passwords**: Use password managers
3. **Principle of least privilege**: Give minimal required permissions
4. **Regular updates**: Keep system updated
5. **Monitor logs**: Check `/var/log/auth.log`
6. **Disable unused accounts**: Lock or remove unnecessary accounts

## Practice Exercises

1. Create a new user account.
2. Add the user to the sudo group.
3. Change permissions on a file to make it executable.
4. Set up ACLs for collaborative file sharing.
5. Configure sudo to allow passwordless execution for a specific command.

Next, we'll cover processes and job management.
