# Resolving Conflicts

## What Causes Conflicts?

Conflicts occur when:
- Two branches modify the same line in the same file
- A file is deleted in one branch but modified in another
- Different changes are made to the same file

## Identifying Conflicts

When a merge or rebase fails due to conflicts:

```bash
git status
```

Shows files with conflicts.

## Conflict Markers

Git marks conflicts with:

```gitdiff
<<<<<<< HEAD
Your changes
=======
Incoming changes
>>>>>>> branch-name
```

## Resolving Process

1. Edit the conflicted files
2. Remove conflict markers
3. Choose which changes to keep
4. Stage the resolved files
5. Commit the resolution

```bash
# Edit file and resolve conflicts
# Then stage
git add resolved-file.txt

# Commit
git commit
```

## Tools for Resolving Conflicts

### Command Line

```bash
# See differences
git diff

# See what you changed
git diff HEAD

# See what they changed
git diff MERGE_HEAD
```

### GUI Tools

```bash
# Use mergetool
git mergetool

# Configure mergetool
git config --global merge.tool vimdiff
```

### Abort Merge/Rebase

```bash
# Abort merge
git merge --abort

# Abort rebase
git rebase --abort
```

## Conflict Resolution Strategies

### Accept Yours

```bash
git checkout --ours file.txt
git add file.txt
```

### Accept Theirs

```bash
git checkout --theirs file.txt
git add file.txt
```

### Manual Resolution

Edit the file manually and remove markers.

## Preventing Conflicts

- Communicate with team
- Pull frequently
- Use feature branches
- Keep commits small and focused

## Binary Files

For binary files, you must choose one version:

```bash
# Keep your version
git checkout --ours binary-file.jpg

# Keep their version
git checkout --theirs binary-file.jpg
```
