# Networking Basics

## IP Addresses and Subnets

### IPv4 Addresses
Format: xxx.xxx.xxx.xxx (0-255 each octet)

Classes:
- Class A: 1-126.xxx.xxx.xxx
- Class B: 128-191.xxx.xxx.xxx
- Class C: 192-223.xxx.xxx.xxx

### Subnet Mask
Determines network and host portions.

Examples:
- 255.255.255.0 (/24): 256 hosts
- 255.255.0.0 (/16): 65,536 hosts
- 255.0.0.0 (/8): 16,777,216 hosts

### CIDR Notation
- 192.168.1.0/24
- 10.0.0.0/8

## Network Configuration

### Viewing Network Information
```bash
ip addr show        # Show IP addresses
ip route show       # Show routing table
hostname -I         # Show IP addresses
```

### NetworkManager (GUI)
Most desktop environments have network settings in system preferences.

### Manual Configuration
```bash
sudo ip addr add 192.168.1.100/24 dev eth0
sudo ip route add default via 192.168.1.1
```

### /etc/network/interfaces (Debian)
```
auto eth0
iface eth0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8 8.8.4.4
```

## DNS (Domain Name System)

### Resolving Names
```bash
nslookup google.com
dig google.com
host google.com
```

### DNS Configuration
`/etc/resolv.conf`:
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

## Network Tools

### ping
```bash
ping google.com     # Test connectivity
ping -c 4 google.com # Send 4 packets
```

### traceroute
```bash
traceroute google.com
```

### netstat
```bash
netstat -tuln      # Listening ports
netstat -rn        # Routing table
```

### ss (socket statistics)
```bash
ss -tuln           # Listening sockets
ss -p              # Show processes
```

### nmap
```bash
sudo apt install nmap
nmap -sP 192.168.1.0/24  # Network scan
nmap google.com          # Port scan
```

### curl and wget
```bash
curl -I google.com       # HTTP headers
wget google.com          # Download file
```

## Firewall (ufw)

### Installing and Enabling
```bash
sudo apt install ufw
sudo ufw enable
```

### Basic Rules
```bash
sudo ufw allow 22        # Allow SSH
sudo ufw allow 80        # Allow HTTP
sudo ufw allow 443       # Allow HTTPS
sudo ufw deny 21         # Deny FTP
```

### Advanced Rules
```bash
sudo ufw allow from 192.168.1.0/24 to any port 22
sudo ufw status numbered
sudo ufw delete 3
```

## SSH (Secure Shell)

### Connecting to Remote Host
```bash
ssh user@hostname
ssh -p 2222 user@hostname  # Custom port
```

### SSH Key Authentication
```bash
ssh-keygen -t rsa         # Generate key pair
ssh-copy-id user@hostname # Copy public key
```

### SSH Config
`~/.ssh/config`:
```
Host myserver
    HostName example.com
    User myuser
    Port 22
    IdentityFile ~/.ssh/id_rsa
```

### SSH Tunneling
```bash
ssh -L 8080:localhost:80 user@remote  # Local tunnel
ssh -R 8080:localhost:80 user@remote  # Remote tunnel
```

## Network Services

### DHCP Server
```bash
sudo apt install isc-dhcp-server
```

### NTP (Network Time Protocol)
```bash
sudo apt install ntp
```

### Samba (File Sharing)
```bash
sudo apt install samba
```

## Wireless Networking

### iwconfig
```bash
iwconfig                # Show wireless interfaces
```

### nmcli (NetworkManager CLI)
```bash
nmcli device wifi list
nmcli device wifi connect SSID password PASSWORD
```

## Troubleshooting

1. Check physical connections
2. Verify IP configuration
3. Test DNS resolution
4. Check firewall rules
5. Use tcpdump for packet analysis
6. Check system logs: `/var/log/syslog`

## Practice Exercises

1. Display your IP address and routing table.
2. Ping a remote host and check latency.
3. Configure a static IP address.
4. Set up SSH key authentication.
5. Configure basic firewall rules.
6. Scan your local network for devices.

Next, we'll cover system maintenance.
