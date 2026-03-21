# .gitignore

## What is .gitignore?

A `.gitignore` file tells Git which files or directories to ignore (not track).

## Creating .gitignore

```bash
# Create .gitignore file
touch .gitignore

# Or create with content
echo "*.log" > .gitignore
```

## Common Patterns

### Operating System Files

```gitignore
# macOS
.DS_Store
.AppleDouble
.LSOverride

# Windows
Thumbs.db
ehthumbs.db
Desktop.ini

# Linux
*~
```

### Programming Languages

```gitignore
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/

# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Ruby
*.gem
.bundle
.byebug_history
.gem
Gemfile.lock
```

### IDEs and Editors

```gitignore
# VS Code
.vscode/
*.code-workspace

# IntelliJ
.idea/
*.iml
*.ipr
*.iws

# Vim
*.swp
*.swo
*~
```

### Logs and Databases

```gitignore
*.log
logs/
*.sqlite3
*.db
```

## Global .gitignore

Set up a global ignore file:

```bash
git config --global core.excludesfile ~/.gitignore_global
```

## Ignoring Already Tracked Files

If a file is already tracked, add it to .gitignore and:

```bash
git rm --cached filename.txt
git commit -m "Remove tracked file"
```

## Negation Patterns

Use `!` to include files that were previously excluded:

```gitignore
*.txt
!important.txt
```

## Directory Patterns

```gitignore
# Ignore all files in a directory
dir/

# But include specific files
!dir/important.txt
```

## Checking Ignored Files

```bash
# Check if file is ignored
git check-ignore -v filename.txt

# List all ignored files
git status --ignored
```
