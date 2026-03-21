# Installing Debian

## Downloading Debian

1. Visit the official Debian website: https://www.debian.org/
2. Go to the "Getting Debian" section.
3. Choose the appropriate ISO image:
   - For beginners: Debian Stable (current stable release).
   - Architecture: amd64 for most modern computers.
4. Download the ISO (about 1GB).

## Installation Methods

### Virtual Machine (Recommended for Beginners)

1. Install virtualization software like VirtualBox or VMware.
2. Create a new VM with at least 2GB RAM and 20GB disk space.
3. Mount the Debian ISO as the boot device.
4. Start the VM and follow the installation prompts.

### Dual Boot

1. Backup your data.
2. Create a bootable USB drive using tools like Rufus (Windows) or dd (Linux/Mac).
3. Boot from the USB drive.
4. Partition your hard drive (leave space for Windows/Linux).
5. Follow the installation wizard.

### Live USB

1. Create a bootable USB with persistent storage.
2. Boot from USB without installing.
3. Install from the live environment if desired.

## Installation Steps

1. **Boot from Installation Media**: Select "Install" or "Graphical Install".
2. **Language Selection**: Choose your preferred language.
3. **Location**: Select your country for time zone and mirror settings.
4. **Keyboard**: Configure your keyboard layout.
5. **Network**: Connect to the internet (recommended).
6. **Hostname**: Set a name for your computer.
7. **Domain**: Leave blank for home use.
8. **Root Password**: Set a strong password for the root user.
9. **User Account**: Create your user account.
10. **Partitioning**: Use guided partitioning for simplicity.
11. **Package Selection**: Select "Debian desktop environment" and "standard system utilities".
12. **Install GRUB**: Yes, to the master boot record.
13. **Finish Installation**: Reboot and remove installation media.

## Post-Installation

After installation:

1. Update your system: `sudo apt update && sudo apt upgrade`
2. Install additional software as needed.
3. Familiarize yourself with the desktop environment (GNOME by default).

Next, we'll explore basic terminal commands.
