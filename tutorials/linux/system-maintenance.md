# System Maintenance

## System Updates

### Regular Updates
```bash
sudo apt update          # Update package lists
sudo apt upgrade         # Upgrade packages
sudo apt full-upgrade    # Full upgrade with dependency changes
sudo apt autoremove      # Remove unused packages
sudo apt autoclean       # Clean package cache
```

### Security Updates
```bash
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades
```

### Kernel Updates
```bash
uname -r                # Check current kernel
sudo apt install linux-image-amd64  # Install latest kernel
```

## Log Management

### System Logs
- `/var/log/syslog`: General system log
- `/var/log/auth.log`: Authentication log
- `/var/log/kern.log`: Kernel messages
- `/var/log/dmesg`: Boot messages

### Viewing Logs
```bash
tail -f /var/log/syslog  # Follow log in real-time
journalctl              # Systemd journal
journalctl -u service   # Service-specific logs
```

### Log Rotation
Configured in `/etc/logrotate.conf` and `/etc/logrotate.d/`

## Disk Management

### Disk Usage
```bash
df -h                   # Filesystem usage
du -h /home             # Directory usage
du -sh *                # Current directory usage
```

### Disk Cleanup
```bash
sudo apt autoremove     # Remove unused packages
sudo apt autoclean      # Clean package cache
sudo journalctl --vacuum-time=7d  # Clean old logs
find /tmp -type f -mtime +7 -delete  # Remove old temp files
```

### SMART Monitoring
```bash
sudo apt install smartmontools
sudo smartctl -a /dev/sda  # Check disk health
```

## Memory Management

### Memory Usage
```bash
free -h                 # Memory and swap usage
vmstat 1                # Virtual memory stats
```

### Swap File
```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

## Service Management

### Systemd
```bash
sudo systemctl status service    # Check service status
sudo systemctl start service    # Start service
sudo systemctl stop service     # Stop service
sudo systemctl restart service  # Restart service
sudo systemctl enable service   # Enable at boot
sudo systemctl disable service  # Disable at boot
```

### Service Logs
```bash
sudo journalctl -u service
sudo journalctl -f -u service   # Follow logs
```

## Backup Strategies

### Full System Backup
```bash
sudo tar -czpf /backup/full-backup-$(date +%Y%m%d).tar.gz --exclude=/proc --exclude=/sys --exclude=/dev --exclude=/mnt --exclude=/tmp --exclude=/backup /
```

### Incremental Backups
Use tools like `rsync`:
```bash
rsync -av --delete /source /backup
```

### Automated Backups
Use cron jobs or tools like `borgbackup`.

## Monitoring Tools

### htop
```bash
sudo apt install htop
htop
```

### iotop
```bash
sudo apt install iotop
sudo iotop
```

### nmon
```bash
sudo apt install nmon
nmon
```

## Performance Tuning

### Kernel Parameters
Edit `/etc/sysctl.conf`:
```
vm.swappiness=10        # Reduce swap usage
net.ipv4.tcp_tw_reuse=1 # Reuse TIME_WAIT sockets
```

Apply changes:
```bash
sudo sysctl -p
```

### CPU Governor
```bash
cpupower frequency-info
cpupower frequency-set -g performance  # High performance
cpupower frequency-set -g powersave    # Power saving
```

## Security Hardening

### SSH Hardening
Edit `/etc/ssh/sshd_config`:
```
PermitRootLogin no
PasswordAuthentication no
AllowUsers youruser
```

### Firewall
```bash
sudo apt install ufw
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
```

### Fail2Ban
```bash
sudo apt install fail2ban
```

## Hardware Monitoring

### Sensors
```bash
sudo apt install lm-sensors
sensors-detect
sensors
```

### CPU Temperature
```bash
sudo apt install psensor
```

## Practice Exercises

1. Update your system and check for security updates.
2. Monitor system logs for any errors.
3. Check disk usage and clean up unnecessary files.
4. Set up automated backups.
5. Configure basic firewall rules.
6. Monitor system performance with htop.

Next, we'll cover advanced topics.
