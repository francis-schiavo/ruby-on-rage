# Package Management with APT

## What is APT?

APT (Advanced Package Tool) is Debian's package management system. It handles installation, upgrade, and removal of software packages.

## Basic Commands

### Update Package Lists
```bash
sudo apt update
```
Updates the local package index with the latest changes from repositories.

### Upgrade Packages
```bash
sudo apt upgrade
```
Upgrades all installed packages to their latest versions.

### Full Upgrade
```bash
sudo apt full-upgrade
```
Performs upgrade and handles changing dependencies.

### Install Packages
```bash
sudo apt install package_name
```
Installs a package and its dependencies.

### Remove Packages
```bash
sudo apt remove package_name
```
Removes a package but keeps configuration files.

### Purge Packages
```bash
sudo apt purge package_name
```
Removes a package and its configuration files.

### Search Packages
```bash
apt search keyword
```
Searches for packages containing the keyword.

### Show Package Information
```bash
apt show package_name
```
Displays detailed information about a package.

### List Installed Packages
```bash
apt list --installed
```
Lists all installed packages.

### Check for Upgrades
```bash
apt list --upgradable
```
Shows packages that can be upgraded.

## Managing Repositories

### Sources List
Located at `/etc/apt/sources.list`

Example entry:
```
deb http://deb.debian.org/debian/ bullseye main contrib non-free
```

### Adding Repositories
1. Edit `/etc/apt/sources.list`
2. Or create files in `/etc/apt/sources.list.d/`
3. Add the repository line
4. Import GPG keys if required
5. Run `sudo apt update`

## Common Tasks

### Install Development Tools
```bash
sudo apt install build-essential git curl wget
```

### Install Ruby and Rails Dependencies
```bash
sudo apt install ruby ruby-dev zlib1g-dev libssl-dev libreadline-dev
```

### Install Node.js
```bash
sudo apt install nodejs npm
```

### Install PostgreSQL
```bash
sudo apt install postgresql postgresql-contrib
```

### Install MySQL
```bash
sudo apt install mysql-server
```

## Troubleshooting

### Fix Broken Packages
```bash
sudo apt --fix-broken install
```

### Clean Package Cache
```bash
sudo apt autoclean
sudo apt autoremove
```

### Resolve Dependencies
```bash
sudo apt install -f
```

## Backports and Testing

### Enable Backports
Add to `/etc/apt/sources.list`:
```
deb http://deb.debian.org/debian bullseye-backports main contrib non-free
```

Install from backports:
```bash
sudo apt install package/bullseye-backports
```

## Package Priorities

APT uses priorities to decide which version to install:
- 1001: Installed manually
- 990: Not automatic
- 500: Standard
- 100: Not automatic, lower priority

## Practice Exercises

1. Update your package lists.
2. Search for and install a text editor (e.g., vim or emacs).
3. Check for upgradable packages.
4. Install development tools.
5. Remove an unused package.

Next, we'll explore user management and permissions.
