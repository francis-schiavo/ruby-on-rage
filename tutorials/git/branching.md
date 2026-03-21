# Branching

## What is a Branch?

A branch is a separate line of development. It allows you to work on features or fixes without affecting the main codebase.

## Creating Branches

```bash
# Create and switch to new branch
git checkout -b feature-branch

# Create branch without switching
git branch feature-branch

# Switch to existing branch
git checkout feature-branch
```

## Listing Branches

```bash
# List local branches
git branch

# List all branches (local and remote)
git branch -a
```

## Switching Between Branches

```bash
git checkout main
git checkout feature-branch
```

## Merging Branches

```bash
# Merge feature-branch into current branch
git merge feature-branch

# Merge with a commit message
git merge feature-branch -m "Merge feature-branch"
```

## Deleting Branches

```bash
# Delete merged branch
git branch -d feature-branch

# Force delete unmerged branch
git branch -D feature-branch
```

## Branch Naming Conventions

- `main` or `master`: Main development branch
- `develop`: Development branch
- `feature/*`: Feature branches
- `bugfix/*`: Bug fix branches
- `hotfix/*`: Hotfix branches

## Checking Out Remote Branches

```bash
# List remote branches
git branch -r

# Checkout remote branch
git checkout -b local-branch origin/remote-branch
```
