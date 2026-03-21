# Configuration

## Setting Up Git

After installing Git, you need to configure it with your name and email.

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Checking Configuration

```bash
git config --global --list
```

## Setting Default Editor

```bash
git config --global core.editor "nano"
# or
git config --global core.editor "vim"
# or
git config --global core.editor "code --wait"
```

## Setting Default Branch Name

```bash
git config --global init.defaultBranch main
```

## Aliases

Create shortcuts for common commands:

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```

Now you can use `git st` instead of `git status`.
