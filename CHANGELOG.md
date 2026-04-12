# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.4] - 2026-04-12

### Added
- `azdo-create-pr` skill for creating well-formatted Azure DevOps pull requests with emoji titles and automatic work item linking
- `openshift-deploy-nextjs` skill for deploying new Next.js applications to OpenShift from scratch
- `openshift-update-app` skill for rebuilding and redeploying existing Next.js apps on OpenShift
- `weekly-digest` skill for summarizing weekly Claude Code and Codex activity into a markdown report
- `cc-clean-branches` command for cleaning up merged and stale git branches
- `cc-create-worktrees-for-pr` command for creating git worktrees for all open PRs at once
- `cc-design-mode` command for browser-based UI testing and design iteration
- `cc-init-project` command for initializing new projects with essential structure
- `cc-merge-branch` command for merging the current branch into main
- `cc-remove-worktree` command for removing git worktrees
- `cc-update-readme` command for reviewing and updating README with recent changes
- `cc-update-changelog` command for generating and maintaining the project changelog

### Changed
- Synced README to accurately reflect all available skills and commands in the repository

## [0.7.3] - 2026-04-10

### Changed
- Enhanced `html-to-email` skill with Outlook paste-safe guidance: detects copy/paste into Outlook compose as a separate rendering target, adds dedicated "Outlook Paste Mode" section covering Word-engine paste behavior, spacer row sizing, and pill/badge layout recommendations

## [0.7.2] - 2026-03-08

### Added
- `frontend-rules` skill with comprehensive Tailwind/React/Next.js constraints covering design tokens, no arbitrary values, no inline styles, no `dark:` variants, TypeScript enforcement, and component extraction rules

### Changed
- Updated CLAUDE.md frontend section to invoke `frontend-rules` skill before writing or modifying any UI file

## [0.7.1] - 2026-02-15

### Changed
- Enhanced CLAUDE.md with plan file management guidelines and independent thinking instructions
- Improved codebase exploration efficiency guidelines with token optimization strategies
- Added browser automation documentation for agent-browser usage

## [0.7.0] - 2026-01-26

### Added
- n8n skills suite for workflow automation
- design-inspirations skill for creating multiple visual variations of UI components
- skill-creator skill for guiding the creation of effective Claude Code skills
- supabase-postgres-best-practices skill for Postgres performance optimization
- remotion-best-practices skill for React video creation with Remotion
- web-design-guidelines skill for UI code review against Web Interface Guidelines
- vercel-react-best-practices skill for React/Next.js performance optimization
- agent-browser skill for web automation using browser CLI tool

### Changed
- Updated README to reflect all available skills documentation

## [0.6.5] - 2026-01-18

### Added
- Fluid typography skill for implementing responsive typography with CSS clamp()
- Theme toggle creator skill for adding dark mode to Next.js applications using next-themes

## [0.6.4] - 2026-01-11

### Changed
- Enhanced Dependabot configuration with ESLint package grouping for better dependency management

## [0.6.3] - 2025-12-15

### Added
- cc-add-theme-toggle command for Next.js dark mode/theme toggle using next-themes
- cc-explain-to-me command for explaining error messages in plain language

### Changed
- Enhanced cc-add-scripts command with additional utility script options
- Updated README to include cc-add-theme-toggle command documentation

## [0.6.2] - 2025-12-07

### Added
- nc-people-research command for interviewer research and interview preparation
- Notion integration for fetching and storing research results

### Changed
- Improved company research template formatting with numbered sections and bullet points
- Enhanced readability by replacing h4 headers with bullet points in company research

## [0.6.1] - 2025-12-02

### Changed
- Enhanced instruction for cc-show-prs and nc-company-research commands
- Improved instruction for cc-add-scripts and cc-commit commands

## [0.6.0] - 2025-11-26

### Added
- cc-add-scripts command for automated project setup
- cc-show-prs command for viewing open pull requests
- nc-company-research command with Notion integration
- Environment variable support for MCP server setup

### Changed
- Refactored all command names with cc- prefix convention
- Configured status line with PowerShell script
- Improved worktree command documentation
- Fixed design system CSS issues

## [0.5.1] - 2025-09-21

### Changed
- Fixed workflow and agent counts in README documentation

## [0.5.0] - 2025-09-08

### Added
- Weekly changelog and README automation via GitHub Actions

### Changed
- Enhanced design system with responsive typography and breakpoint-aware sizing
- Improved CSS utilities with better button inheritance and card styling
- Restructured GitHub workflow files from claude/ directory to cc- prefixed naming
- Updated commit command documentation with build cache clearing examples
- Added Python command approval to settings configuration

## [0.4.0] - 2025-08-28

### Added
- GitHub workflows command for automated CI/CD setup
- Comprehensive GitHub workflow templates including:
  - CI/CD pipeline with Node.js testing and build
  - Dependabot configuration with auto-merge capabilities
  - Claude Code integration workflows for automated PR reviews
  - Claude assistant workflow for interactive GitHub support

### Changed
- Updated commands instructions
- Updated allowed tools in default settings

## [0.3.0] - 2025-08-25

### Added
- OpenAI agent with comprehensive API playbook covering Responses API, structured outputs, tool use, streaming, and realtime features
- Supabase edge function deployment command for automated deployment workflows

## [0.2.0] - 2025-08-23

### Added
- Git worktree command definitions for branch management
- Comprehensive design system setup commands

### Changed
- Enhanced commit command documentation with comprehensive checks
- Updated allowed tools in default settings 

## [0.1.0] - 2025-08-08

### Added
- Initial Claude Code workspace setup
- Project structure and configuration
- MCP server installation automation script (`scripts/add-mcp-server.sh`)
  - Automated installation of playwright MCP server
  - Automated installation of context7 MCP server
  - Proper scoping configuration for MCP servers