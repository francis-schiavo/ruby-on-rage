# Cloning

## Cloning a Repository

```bash
git clone https://github.com/user/repo.git
```

This creates a new directory with the repository name and downloads all the files and history.

## Cloning to a Specific Directory

```bash
git clone https://github.com/user/repo.git my-project
```

## Cloning Specific Branch

```bash
# Clone only the main branch
git clone --single-branch --branch main https://github.com/user/repo.git

# Clone all branches
git clone https://github.com/user/repo.git
```

## Shallow Clone

Clone only recent history to save space:

```bash
# Clone last 10 commits
git clone --depth 10 https://github.com/user/repo.git
```

## Cloning with Submodules

If the repository has submodules:

```bash
git clone --recurse-submodules https://github.com/user/repo.git
```

## After Cloning

```bash
cd repo-name
git remote -v  # Check remotes
git branch -a  # List all branches
git status     # Check status
```

## Bare Clone

Create a bare repository (no working directory):

```bash
git clone --bare https://github.com/user/repo.git repo.git
```
