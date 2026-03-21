# Semantic Commits

## What are Semantic Commits?

Semantic commits follow a standardized format for commit messages that clearly communicate the nature of changes.

## Conventional Commits Specification

The format is: `type(scope): description`

### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

### Scope (Optional)

A scope can be provided to specify the place of the commit change.

Examples: `auth`, `api`, `ui`, `db`

### Description

A short description of the change.

### Body (Optional)

A longer description of the change.

### Footer (Optional)

Breaking changes, issues closed, etc.

## Examples

```
feat(auth): add user login functionality

fix(ui): resolve button alignment issue in header

docs(readme): update installation instructions

feat(api)!: change user endpoint response format

fix: prevent racing condition in user service

refactor: extract common code to utils module
```

## Breaking Changes

Mark breaking changes with `!` after type or in footer:

```
feat!: change API response format

feat(api): change response format

BREAKING CHANGE: The API response format has changed
```

## Benefits

- **Automated Versioning**: Tools can automatically determine version bumps
- **Changelogs**: Generate changelogs from commit messages
- **Communication**: Clear communication of changes to team members
- **Consistency**: Standardized format across the project

## Tools and Integration

### Commitizen

Interactive tool for creating semantic commits:

```bash
npm install -g commitizen
```

### Husky + Commitlint

Enforce semantic commits with Git hooks:

```bash
npm install --save-dev @commitlint/cli @commitlint/config-conventional husky
```

### Semantic Release

Automate versioning and releasing:

```bash
npm install --save-dev semantic-release
```

## Version Calculation

- `fix`: Patch release (1.0.0 → 1.0.1)
- `feat`: Minor release (1.0.0 → 1.1.0)
- `BREAKING CHANGE`: Major release (1.0.0 → 2.0.0)

## Best Practices

- Use lowercase for types and descriptions
- Start descriptions with imperative mood ("add" not "added")
- Keep descriptions under 72 characters
- Use scopes consistently
- Be specific in descriptions
- Use body for complex changes
- Reference issues in footer when applicable

## Implementation

### Git Hook Example

Create `.git/hooks/commit-msg`:

```bash
#!/bin/sh
npx --no-install commitlint --edit "$1"
```

### Commitlint Config

`.commitlintrc.js`:

```javascript
module.exports = {
  extends: ['@commitlint/config-conventional']
};
```
