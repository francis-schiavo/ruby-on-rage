# Advanced Topics

## Kernel Compilation

### Why Compile Kernel?
- Custom features
- Performance optimization
- Latest features/patches
- Remove unnecessary modules

### Steps
1. Get kernel source:
```bash
sudo apt install linux-source
tar -xvf /usr/src/linux-source-*.tar.xz
cd linux-source-*/
```

2. Configure:
```bash
make menuconfig  # Or xconfig, gconfig
```

3. Compile:
```bash
make -j$(nproc)  # Use all CPU cores
sudo make modules_install
sudo make install
sudo update-grub
```

4. Reboot into new kernel.

## LVM (Logical Volume Management)

### Benefits
- Resize volumes without downtime
- Snapshots
- Striping/mirroring

### Setup
```bash
sudo apt install lvm2
sudo pvcreate /dev/sdb
sudo vgcreate myvg /dev/sdb
sudo lvcreate -L 10G -n mylv myvg
sudo mkfs.ext4 /dev/myvg/mylv
```

### Management
```bash
sudo lvextend -L +5G /dev/myvg/mylv  # Extend
sudo resize2fs /dev/myvg/mylv        # Resize filesystem
sudo lvcreate -L 1G -s -n mysnap myvg/mylv  # Snapshot
```

## RAID

### Software RAID
```bash
sudo apt install mdadm
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdb /dev/sdc
sudo mkfs.ext4 /dev/md0
```

### RAID Levels
- RAID 0: Striping (performance)
- RAID 1: Mirroring (redundancy)
- RAID 5: Distributed parity
- RAID 10: Striped mirrors

## Containers

### Docker
```bash
sudo apt install docker.io
sudo systemctl start docker
sudo usermod -aG docker $USER
```

Basic usage:
```bash
docker run hello-world
docker build -t myimage .
docker run -d -p 80:80 myimage
```

### LXC/LXD
```bash
sudo apt install lxd
sudo lxd init
lxc launch ubuntu:18.04 mycontainer
lxc exec mycontainer -- bash
```

## Virtualization

### KVM
```bash
sudo apt install qemu-kvm libvirt-daemon-system
sudo adduser $USER libvirt
sudo systemctl start libvirtd
```

### VirtualBox
```bash
sudo apt install virtualbox
```

## Systemd Advanced Features

### Timers
Replace cron jobs:
```bash
sudo systemctl edit --force --full mytimer.timer
```

Example timer:
```
[Unit]
Description=Run my script daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```

### Services
Create custom services in `/etc/systemd/system/`:
```
[Unit]
Description=My Service

[Service]
ExecStart=/path/to/script
Restart=always

[Install]
WantedBy=multi-user.target
```

## Security

### SELinux/AppArmor
```bash
sudo apt install apparmor
sudo apparmor_status
```

### Intrusion Detection
```bash
sudo apt install rkhunter chkrootkit
sudo rkhunter --check
```

### VPN
```bash
sudo apt install openvpn
```

### Certificate Management
```bash
sudo apt install certbot
certbot certonly --webroot -w /var/www/html -d example.com
```

## Performance Monitoring

### sysstat
```bash
sudo apt install sysstat
sar -u 1 5  # CPU usage
iostat -x 1  # I/O stats
```

### Prometheus + Grafana
For advanced monitoring.

## Automation

### Ansible
```bash
sudo apt install ansible
```

Playbook example:
```yaml
---
- hosts: servers
  tasks:
  - name: Update packages
    apt:
      update_cache: yes
      upgrade: yes
```

### Puppet/Chef
Configuration management tools.

## Cloud Integration

### AWS CLI
```bash
sudo apt install awscli
aws configure
```

### Google Cloud SDK
```bash
sudo apt install google-cloud-sdk
```

## Troubleshooting Advanced Issues

### Kernel Panics
Check `/var/log/kern.log`, update kernel, check hardware.

### Boot Issues
Use recovery mode, check `/boot/grub/grub.cfg`.

### Network Issues
Use `tcpdump`, `wireshark`, check routing.

### Performance Issues
Use `perf`, `strace`, check system calls.

## Practice Exercises

1. Set up a simple RAID 1 array.
2. Create a systemd timer for automated tasks.
3. Install and run a Docker container.
4. Configure a basic firewall with advanced rules.
5. Set up SSH with key-based authentication and disable password login.

## Conclusion

This concludes our Linux tutorial series. You've learned from basic installation to advanced system administration. Remember:

- Practice regularly
- Read documentation (`man` pages, official docs)
- Join Linux communities (forums, IRC, Reddit)
- Stay updated with security patches
- Experiment in virtual machines before production

Happy Linux-ing!
