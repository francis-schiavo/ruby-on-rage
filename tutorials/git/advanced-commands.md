# Advanced Commands

## Rebasing

Rewrite commit history by replaying commits on top of another branch.

```bash
# Rebase current branch onto main
git rebase main

# Interactive rebase (edit, squash, etc.)
git rebase -i HEAD~3

# Continue after resolving conflicts
git rebase --continue

# Abort rebase
git rebase --abort
```

## Stashing

Temporarily save changes without committing.

```bash
# Stash changes
git stash

# Stash with message
git stash save "Work in progress"

# List stashes
git stash list

# Apply latest stash
git stash apply

# Apply specific stash
git stash apply stash@{1}

# Drop stash
git stash drop

# Apply and drop
git stash pop
```

## Cherry Picking

Apply specific commits from another branch.

```bash
# Cherry pick a commit
git cherry-pick abc123

# Cherry pick multiple commits
git cherry-pick abc123 def456

# Cherry pick range
git cherry-pick abc123..def456
```

## Tagging

Mark specific points in history.

```bash
# Create lightweight tag
git tag v1.0

# Create annotated tag
git tag -a v1.0 -m "Version 1.0"

# List tags
git tag

# Push tags
git push --tags

# Delete tag
git tag -d v1.0
```

## Reflog

View reference logs to recover lost commits.

```bash
# Show reflog
git reflog

# Recover deleted branch
git checkout -b recovered-branch HEAD@{2}

# Recover lost commit
git cherry-pick HEAD@{1}
```

## Bisect

Find which commit introduced a bug.

```bash
# Start bisect
git bisect start

# Mark current commit as bad
git bisect bad

# Mark known good commit
git bisect good v1.0

# Git will checkout a commit, test and mark
git bisect good  # or git bisect bad

# End bisect
git bisect reset
```

## Worktrees

Work on multiple branches simultaneously.

```bash
# Create worktree
git worktree add ../feature-branch feature-branch

# List worktrees
git worktree list

# Remove worktree
git worktree remove feature-branch
```

## Submodules

Include other repositories within your repository.

```bash
# Add submodule
git submodule add https://github.com/user/library.git libs/library

# Clone with submodules
git clone --recurse-submodules https://github.com/user/repo.git

# Update submodules
git submodule update --init --recursive
```
