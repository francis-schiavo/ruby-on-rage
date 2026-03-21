# Installation

## Installing Git on Linux

### Ubuntu/Debian

```bash
sudo apt update
sudo apt install git
```

### CentOS/RHEL/Fedora

```bash
sudo yum install git  # CentOS/RHEL
sudo dnf install git  # Fedora
```

## Installing Git on macOS

### Using Homebrew

```bash
brew install git
```

### Using Xcode Command Line Tools

```bash
xcode-select --install
```

## Installing Git on Windows

Download from the official Git website: https://git-scm.com/download/win

Or use Chocolatey:

```powershell
choco install git
```

## Verifying Installation

```bash
git --version
```

This should output something like: `git version 2.34.1`
