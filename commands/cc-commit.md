---
allowed-tools: Bash(git commit:*), Bash(git push:*), Bash(npm run format:*), Bash(npm run typecheck:*), Bash(npm run lint:*)
description: Create a commit
---

# Commit Changes

This command helps you create well-formatted commits with conventional commit messages and emoji.

## Usage

To create a commit, just type:
```
/cc-commit
```

Or with options:
```
/cc-commit --no-verify
```

## Instructions

1. Unless specified with `--no-verify`, automatically runs pre-commit checks:
   - `npm run lint` to ensure code quality
   - `npm run build` to verify the build succeeds (remove build cache first, e.g. `rm -rf .next` for Next.js project)
   - `npm run test` to verify the tests succeed
   - `npm run typecheck` to verify the types succeed
   - `npm run format:check` to check for code style issues
2. Update README.md as needed
3. Checks which files are staged with `git status`
4. If 0 files are staged, automatically adds all modified and new files with `git add`
5. DO NOT add any untracked files if there are already staged files
6. Performs a `git diff` to understand what changes are being committed
7. Analyzes the diff to determine if multiple distinct logical changes are present
8. If multiple distinct changes are detected, suggests breaking the commit into multiple smaller commits
9. For each commit (or the single commit if not split), creates a commit message using emoji conventional commit format
10. If currently on main branch, PUSH to remote after committing

## Best Practices for Commits

- **Verify before committing**: Ensure code is linted, builds correctly, and documentation is updated
- **Atomic commits**: Each commit should contain related changes that serve a single purpose
- **Split large changes**: If changes touch multiple concerns, split them into separate commits
- **Conventional commit format**: Use the format `<type>(<scope>): <description>` where type is one of:
  - `feat`: A new feature
  - `fix`: A bug fix
  - `docs`: Documentation changes
  - `style`: Code style changes (formatting, etc)
  - `refactor`: Code changes that neither fix bugs nor add features
  - `perf`: Performance improvements
  - `test`: Adding or fixing tests
  - `chore`: Changes to the build process, tools, etc.
- **Present tense, imperative mood**: Write commit messages as commands (e.g., "add feature" not "added feature")
- **Concise first line**: Keep the first line under 72 characters
- **Emoji**: Each commit type is paired with an appropriate emoji:
  - ✨ `feat`: New feature
  - 🏷️ `feat`: Add or update types
  - 🌐 `feat`: Internationalization and localization
  - 📱 `feat`: Work on responsive design
  - 🚸 `feat`: Improve user experience / usability
  - 📈 `feat`: Add or update analytics or tracking code
  - 💥 `feat`: Introduce breaking changes
  - ♿️ `feat`: Improve accessibility
  - 🚩 `feat`: Add, update, or remove feature flags
  - 🦺 `feat`: Add or update code related to validation
  - ✈️ `feat`: Improve offline support
  - 🐛 `fix`: Bug fix
  - 🚨 `fix`: Fix compiler/linter warnings
  - 🔒️ `fix`: Fix security issues
  - 🩹 `fix`: Simple fix for a non-critical issue
  - 🥅 `fix`: Catch errors
  - 👽️ `fix`: Update code due to external API changes
  - 🔥 `fix`: Remove code or files
  - 🚑️ `fix`: Critical hotfix
  - 💚 `fix`: Fix CI build
  - ✏️ `fix`: Fix typos
  - 🔇 `fix`: Remove logs
  - 🔧 `chore`: Tooling, configuration
  - 👥 `chore`: Add or update contributors
  - 🔀 `chore`: Merge branches
  - 📦️ `chore`: Add or update compiled files or packages
  - ➕ `chore`: Add a dependency
  - ➖ `chore`: Remove a dependency
  - 🌱 `chore`: Add or update seed files
  - 🧑 `chore`: Improve developer experience
  - 🎉 `chore`: Begin a project
  - 🔖 `chore`: Release/Version tags
  - 📌 `chore`: Pin dependencies to specific versions
  - 📄 `chore`: Add or update license
  - 🙈 `chore`: Add or update .gitignore file
  - 🎨 `style`: Improve structure/format of the code
  - 💄 `style`: Formatting/style
  - 🍱 `assets`: Add or update assets
  - 📝 `docs`: Documentation
  - ♻️ `refactor`: Code refactoring
  - 🚚 `refactor`: Move or rename resources
  - 🏗️ `refactor`: Make architectural changes
  - ⚡️ `perf`: Performance improvements
  - ✅ `test`: Tests
  - 🤡 `test`: Mock things
  - 🚀 `ci`: CI/CD improvements
  - 🗃️ `db`: Perform database related changes

## Guidelines for Splitting Commits

When analyzing the diff, consider splitting commits based on these criteria:

1. **Different concerns**: Changes to unrelated parts of the codebase
2. **Different types of changes**: Mixing features, fixes, refactoring, etc.
3. **File patterns**: Changes to different types of files (e.g., source code vs documentation)
4. **Logical grouping**: Changes that would be easier to understand or review separately
5. **Size**: Very large changes that would be clearer if broken down

## Examples

Good commit messages:
- ✨ feat(auth): add user authentication system
- 🐛 fix(memory): resolve memory leak in rendering process
- 📝 docs(api): update API documentation with new endpoints
- ♻️ refactor(parser): simplify error handling logic in parser
- 🚨 fix(lint): resolve linter warnings in component files
- 🧑 chore(tooling): improve developer tooling setup process
- 🩹 fix(ui): address minor styling inconsistency in header
- 🚑️ fix(auth): patch critical security vulnerability in auth flow
- 🎨 style(components): reorganize component structure for better readability
- 🔥 fix(core): remove deprecated legacy code
- 🦺 feat(auth): add input validation for user registration form
- 💚 fix(ci): resolve failing CI pipeline tests
- 📈 feat(analytics): implement tracking for user engagement
- 🔒️ fix(auth): strengthen authentication password requirements
- ♿️ feat(forms): improve accessibility for screen readers
- 🎨 style(components): reorganize component structure for better readability
- 🔥 fix(core): remove deprecated legacy code
- 🦺 feat(auth): add input validation for user registration form
- 💚 fix(ci): resolve failing CI pipeline tests
- 📈 feat(analytics): implement tracking for user engagement
- 🔒️ fix(auth): strengthen authentication password requirements
- ♿️ feat(forms): improve accessibility for screen readers

Example of splitting commits:
- First commit: ✨ feat(solc): add new solc version type definitions
- Second commit: 📝 docs(solc): update documentation for new solc versions
- Third commit: 🔧 chore(deps): update package.json dependencies
- Fourth commit: 🏷️ feat(api): add type definitions for new API endpoints
- Fifth commit: 🧵 feat(worker): improve concurrency handling in worker threads
- Sixth commit: 🚨 fix(lint): resolve linting issues in new code
- Seventh commit: ✅ test(solc): add unit tests for new solc version features
- Eighth commit: 🔒️ fix(deps): update dependencies with security vulnerabilities

## Command Options

- `--no-verify`: Skip running the pre-commit checks (lint, build, generate:docs)

## Important Notes

- By default, pre-commit checks (`npm run lint`, `npm run build`, `npm run test`, `npm run typecheck`, `npm run format:check`) will run to ensure code quality
- If format check fails, run `npm run format` to fix. If other checks fail, ALWAYS ask the user if they want to proceed with the commit anyway or fix the issues first
- If specific files are already staged, the command will only commit those files; DO NOT stage any untracked files
- If no files are staged, it will automatically stage all modified and new files
- The commit message will be constructed based on the changes detected
- Before committing, the command will review the diff to identify if multiple commits would be more appropriate
- If suggesting multiple commits, it will help you stage and commit the changes separately
- Always reviews the commit diff to ensure the message matches the changes