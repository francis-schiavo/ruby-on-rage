# Creating a Repository

## Initializing a New Repository

To create a new Git repository in an existing directory:

```bash
cd /path/to/your/project
git init
```

This creates a `.git` directory that contains all the repository data.

## Cloning an Existing Repository

To copy an existing repository:

```bash
git clone https://github.com/user/repo.git
```

This creates a new directory with the repository name and clones the content.

## Checking Repository Status

```bash
git status
```

This shows the current state of the working directory and staging area.

## Adding Files to the Repository

```bash
git add filename.txt
# or add all files
git add .
```

## Committing Changes

```bash
git commit -m "Initial commit"
```

This creates a snapshot of the staged changes.
