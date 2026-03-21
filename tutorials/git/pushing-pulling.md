# Pushing and Pulling

## Pushing Changes

Send your local commits to a remote repository:

```bash
# Push current branch to its upstream branch
git push

# Push specific branch
git push origin main

# Push all branches
git push --all

# Force push (dangerous, overwrites remote)
git push --force

# Force push with lease (safer)
git push --force-with-lease
```

## Pulling Changes

Fetch and merge changes from remote:

```bash
# Pull from upstream branch
git pull

# Pull from specific remote and branch
git pull origin main

# Pull with rebase instead of merge
git pull --rebase
```

## Fetch vs Pull

- **git fetch**: Downloads changes but doesn't merge
- **git pull**: Downloads and merges changes

```bash
# Fetch only
git fetch origin

# Then merge manually
git merge origin/main
```

## Handling Push Rejections

If push is rejected due to non-fast-forward:

```bash
# Pull and merge first
git pull

# Or pull with rebase
git pull --rebase

# Then push
git push
```

## Pushing Tags

```bash
# Push specific tag
git push origin v1.0

# Push all tags
git push --tags
```

## Deleting Remote Branches

```bash
git push origin --delete feature-branch
```

## Pushing to Multiple Remotes

```bash
# Add multiple remotes
git remote add origin https://github.com/user/repo.git
git remote add backup https://gitlab.com/user/repo.git

# Push to all remotes
git push --all
```
