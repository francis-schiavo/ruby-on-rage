# Staging and Committing

## The Three Areas of Git

1. **Working Directory**: Your local file system
2. **Staging Area (Index)**: Files ready to be committed
3. **Repository**: Committed snapshots

## Staging Files

Add files to the staging area:

```bash
# Add specific file
git add filename.txt

# Add all files in current directory
git add .

# Add all modified and new files
git add -A

# Interactive staging
git add -p
```

## Unstaging Files

Remove files from staging area:

```bash
# Unstage specific file
git reset filename.txt

# Unstage all files
git reset
```

## Committing Changes

```bash
# Commit staged changes
git commit -m "Commit message"

# Commit all modified files (add + commit)
git commit -a -m "Commit message"

# Amend the last commit
git commit --amend -m "New message"
```

## Viewing Commit History

```bash
# Show commit log
git log

# Show compact log
git log --oneline

# Show with file changes
git log --stat
```

## Undoing Commits

```bash
# Undo last commit but keep changes staged
git reset --soft HEAD~1

# Undo last commit and unstage changes
git reset HEAD~1

# Undo last commit and discard changes
git reset --hard HEAD~1
```
