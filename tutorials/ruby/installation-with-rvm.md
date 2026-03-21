# Installation with RVM

## What is RVM?

RVM (Ruby Version Manager) is a command-line tool that allows you to easily install, manage, and work with multiple Ruby environments.

## Prerequisites

Before installing RVM, ensure you have the required dependencies:

```bash
sudo apt update
sudo apt install curl gnupg2
```

## Installing RVM

### Method 1: Using the installation script

```bash
curl -sSL https://get.rvm.io | bash
```

### Method 2: Using GPG key (recommended)

```bash
# Import GPG key
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

# Install RVM
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

curl -sSL https://get.rvm.io | bash -s stable
```

## Loading RVM

After installation, load RVM in your shell:

```bash
source ~/.rvm/scripts/rvm
```

Or restart your terminal.

## Verifying Installation

```bash
rvm --version
```

## Installing Ruby

### Install latest stable Ruby

```bash
rvm install ruby
```

### Install specific version

```bash
rvm install 3.2.0
```

### List available Ruby versions

```bash
rvm list known
```

## Using Ruby Versions

### Set default Ruby

```bash
rvm use 3.2.0 --default
```

### Switch between versions

```bash
rvm use 3.1.0
rvm use 3.2.0
```

### Check current Ruby

```bash
ruby --version
which ruby
```

## Managing Gemsets

RVM allows you to create isolated gem environments:

### Create gemset

```bash
rvm gemset create myproject
```

### Use gemset

```bash
rvm gemset use myproject
```

### List gemsets

```bash
rvm gemset list
```

## RVM Configuration

### Auto-switching Ruby versions

Create `.ruby-version` file in project directory:

```bash
echo "3.2.0" > .ruby-version
```

### Auto-switching gemsets

Create `.ruby-gemset` file:

```bash
echo "myproject" > .ruby-gemset
```

## Updating RVM

```bash
rvm get stable
```

## Troubleshooting

### PATH issues

If Ruby commands don't work, check your PATH:

```bash
echo $PATH
```

Make sure `~/.rvm/bin` is in your PATH.

### GPG key issues

If you get GPG errors, try:

```bash
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
```

### Permission issues

If you get permission errors, you might need to fix ownership:

```bash
sudo chown -R $USER:$USER ~/.rvm
```

## Alternatives to RVM

- **rbenv**: Lightweight alternative
- **chruby**: Another simple version manager
- **System Ruby**: Using Debian's package manager (not recommended for development)

## Next Steps

After installing Ruby with RVM:

1. Verify installation: `ruby --version`
2. Install Bundler: `gem install bundler`
3. Start coding!

RVM makes it easy to manage multiple Ruby versions and gemsets, which is essential for Ruby development.
