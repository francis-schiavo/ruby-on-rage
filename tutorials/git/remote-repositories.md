# Remote Repositories

## What is a Remote?

A remote is a version of your repository hosted on a server (like GitHub, GitLab, Bitbucket).

## Adding Remotes

```bash
# Add a remote named 'origin'
git remote add origin https://github.com/user/repo.git

# Add multiple remotes
git remote add upstream https://github.com/original/repo.git
```

## Listing Remotes

```bash
# List remotes
git remote

# List remotes with URLs
git remote -v
```

## Fetching from Remotes

```bash
# Fetch all branches from all remotes
git fetch

# Fetch from specific remote
git fetch origin

# Fetch and merge (equivalent to pull)
git pull origin main
```

## Pushing to Remotes

```bash
# Push current branch to remote
git push origin main

# Push all branches
git push --all origin

# Push tags
git push --tags
```

## Tracking Branches

```bash
# Set upstream for current branch
git push -u origin main

# Check tracking branches
git branch -vv
```

## Removing Remotes

```bash
git remote remove origin
```

## Changing Remote URLs

```bash
# Change URL
git remote set-url origin https://github.com/newuser/repo.git

# Add SSH URL
git remote set-url origin git@github.com:user/repo.git
```
