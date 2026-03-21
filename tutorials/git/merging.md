# Merging

## Fast-Forward Merge

When the branch you're merging has commits that are directly ahead of the current branch.

```bash
git checkout main
git merge feature-branch
```

## Three-Way Merge

When branches have diverged and Git needs to create a merge commit.

```bash
git checkout main
git merge feature-branch
# This creates a merge commit
```

## Merge Conflicts

When the same lines in the same files have been changed in both branches.

### Resolving Conflicts

1. Git will mark the conflicted files
2. Edit the files to resolve conflicts
3. Stage the resolved files
4. Commit the merge

```bash
# After conflict occurs
git status

# Edit conflicted files
# Remove conflict markers (<<<<<<<, =======, >>>>>>>)

# Stage resolved files
git add resolved-file.txt

# Commit the merge
git commit
```

### Aborting a Merge

```bash
git merge --abort
```

## Merge Strategies

### Recursive (default for branches)

```bash
git merge -s recursive feature-branch
```

### Ours (keep current branch changes)

```bash
git merge -s ours feature-branch
```

### Theirs (keep other branch changes)

```bash
git merge -X theirs feature-branch
```

## Squash Merging

Combine all commits from a branch into a single commit.

```bash
git merge --squash feature-branch
git commit -m "Squashed commit message"
```

## Rebase vs Merge

- **Merge**: Preserves history, creates merge commits
- **Rebase**: Creates linear history, rewrites commits

```bash
# Rebase instead of merge
git checkout feature-branch
git rebase main
```
