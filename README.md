# Claude Code Workspace

A comprehensive Claude Code workspace configuration with custom commands, specialized agents, hooks, skills, scheduled tasks, and GitHub integration for enhanced development workflows.

## Overview

This workspace provides a collection of custom commands, specialized agents, reusable skills, and GitHub integrations designed to streamline development workflows with Claude Code. It includes tools for git automation, design system setup, project initialization, research workflows, documentation maintenance, and CI/CD automation.

## Features

### Commands (23 available)

All Claude Code workflow commands use the `cc-` prefix. Research commands use the `nc-` and `se-` prefixes.

#### Git Workflow Commands

- **cc-create-worktree** - Create git worktrees for parallel feature development
- **cc-remove-worktree** - Clean up git worktrees when branches are done
- **cc-create-worktrees-for-pr** - Set up worktrees specifically for pull request workflows
- **cc-create-pr** - Automated pull request creation with proper formatting
- **cc-merge-branch** - Streamlined branch merging with cleanup
- **cc-clean-branches** - Remove stale local and remote branches
- **cc-commit** - Enhanced commit command with comprehensive checks
- **cc-show-prs** - Display and manage pull requests

#### Project Setup Commands

- **cc-init-project** - Initialize new projects with standardized structure
- **cc-setup-design-system** - Create comprehensive Tailwind CSS design systems
- **cc-add-theme-toggle** - Add dark mode/theme toggle to Next.js applications using next-themes
- **cc-design-mode** - Switch projects into design/prototyping mode
- **cc-add-scripts** - Add utility scripts to projects

#### Deployment Commands

- **cc-deploy-supabase-edge-function** - Deploy edge functions to Supabase with automated setup

#### GitHub Integration Commands

- **cc-add-gh-workflows** - Set up comprehensive GitHub workflows for CI/CD automation

#### Maintenance Commands

- **cc-update-readme** - Automatically update README files based on recent changes
- **cc-update-changelog** - Generate and maintain changelog entries
- **nc-save-learning** - Capture key learnings from a conversation into a structured markdown file

#### Utility Commands

- **cc-explain-to-me** - Explain error messages in plain, technically accurate language

#### Research Commands

- **nc-company-research** - Research and analyze company information
- **nc-people-research** - Comprehensive people research for interview preparation
- **se-company-research** - Sales engineering company research through product and ICP context
- **se-people-research** - Sales engineering people research for discovery and demo preparation

### Agents (4 available)

- **openai** - Comprehensive OpenAI API implementation guidance covering Responses API, structured outputs, tool use, streaming, and realtime features
- **copy-writer** - Brand copywriting support for consistent conversational, playful, and concise product copy
- **ui-designer-general** - General UI design support for modern, accessible, implementable interfaces
- **ui-designer** - Project-specific travel app UI design guidance with warm, joyful, mobile-first patterns

### Skills (13 available)

- **agent-browser** - Browser automation and web interaction capabilities for agents
- **azdo-create-pr** - Create Azure DevOps pull requests with proper formatting, emoji titles, and work item linking
- **design-inspirations** - Create multiple visual variations of UI components
- **fluid-typography** - Create responsive, fluid typography systems using CSS clamp() with mathematically precise scaling
- **frontend-rules** - Strict rules and constraints for all frontend development in Next.js/React/Tailwind projects
- **html-to-email** - Convert HTML files into email-client-safe HTML with Outlook, Gmail, Apple Mail, and Yahoo compatibility
- **notion-page** - Create and format Notion pages from markdown with proper block structure and rich formatting patterns
- **openshift-deploy-nextjs** - Deploy Next.js applications to OpenShift from scratch with full configuration
- **openshift-update-app** - Rebuild and redeploy existing Next.js applications on OpenShift
- **setup-design-system-tw** - Set up a maintainable Tailwind CSS v4 design system with semantic tokens and component classes
- **skill-creator** - Tools and templates for creating new custom skills
- **theme-toggle-creator** - Set up dark mode/theme toggle in Next.js applications with next-themes integration
- **weekly-digest** - Summarize weekly Claude Code and Codex activity into a structured markdown digest

### Scheduled Tasks (1 available)

- **weekly-recap** - Run the weekly digest workflow for personal Claude Code and Codex activity summaries

### Hooks (3 available)

- **notification.ts** - Logs notifications and plays sound/speech alerts when agents need attention
- **stop.ts** - Handles agent completion events with sound notifications and chat transcript processing
- **subagent_stop.ts** - Manages subagent completion notifications with cross-platform sound support

### GitHub Integration & Workflows (5 workflows)

#### CI/CD Workflows

- **ci.yml** - Continuous integration with Node.js testing and build automation
- **auto-merge-dependabot.yml** - Automated dependency updates with auto-merge capabilities

#### Claude Code Integration Workflows

- **cc-assistant.yml** - Interactive GitHub support with Claude Code integration
- **cc-auto-review.yml** - Automated pull request reviews using Claude Code
- **changelogbot.yml** - Automated changelog and README updates on weekly schedule using `cc-` prefixed commands

## Recent Updates

### v0.7.4 - 2026-04-18

- Added `nc-save-learning`, `se-company-research`, and `se-people-research` commands
- Added copywriting and UI design agent templates
- Added the `notion-page` skill for creating formatted Notion pages
- Added the `weekly-recap` scheduled task for personal weekly digest generation
- Added repository-level `AGENTS.md` instructions for Codex workflows and enabled the Caveman plugin marketplace setting

### v0.7.3 - 2026-04-10

- Enhanced `html-to-email` skill with Outlook paste-safe guidance for copy/paste into the Outlook compose window

### v0.7.2 - 2026-03-08

- Added `frontend-rules` skill with comprehensive Tailwind/React/Next.js constraints covering design tokens, no arbitrary values, no inline styles, TypeScript enforcement, and component extraction rules
- Updated `CLAUDE.md` frontend section to automatically invoke `frontend-rules` skill before writing or modifying any UI file

### v0.7.1 - 2026-02-15

- Enhanced `CLAUDE.md` with plan file management guidelines and independent thinking instructions
- Improved codebase exploration efficiency guidelines with token optimization strategies
- Added browser automation documentation for `agent-browser` usage

### v0.7.0 - 2026-01-26

- Added `design-inspirations`, `skill-creator`, and `agent-browser` skills
- Added specialized best-practice skills for Postgres, Remotion, web design, and React/Next.js performance in local skill directories
- Updated README to reflect available skills documentation

## Design System

The workspace includes a sophisticated design system setup that provides:

- Tailwind CSS integration with CSS variables as the single source of truth
- Dark mode support via class-based switching
- Comprehensive component library patterns for buttons, cards, forms, and badges
- Accessibility-first defaults with reduced motion support
- Scalable token system for colors, typography, and spacing

## Usage

### Commands

Available via Claude Code's slash command interface:

```text
/cc-create-worktree feature-branch-name
/cc-setup-design-system
/cc-add-gh-workflows
/cc-update-readme
/cc-commit
/se-company-research Acme Corp
```

### Agents

Automatically invoked by Claude Code when working on relevant tasks or explicitly requested for specialized assistance.

### Skills

Reusable capabilities that can be invoked for specialized tasks including:

- Frontend rules enforcement for Next.js/React/Tailwind projects
- Tailwind CSS v4 design system scaffolding
- Typography systems and theme toggles
- Email-client-safe HTML conversion
- Browser automation
- Custom skill creation
- UI design patterns and variations
- Notion page creation and formatting
- Azure DevOps PR creation with formatting and work item linking
- OpenShift deployment and update workflows for Next.js apps
- Weekly activity digest generation from Claude Code and Codex logs

### Scheduled Tasks

Task definitions live under `scheduled-tasks/` and can wrap commands or skills for recurring local workflows, such as weekly personal activity summaries.

### Hooks

Event-driven TypeScript scripts automatically execute on Claude Code events:

- Provide audio/visual notifications for agent states
- Log agent activities for monitoring and debugging
- Support cross-platform notification sounds

### GitHub Workflows

Automatically deployed when using `/cc-add-gh-workflows`. Includes CI/CD automation, dependency management, weekly documentation maintenance, and Claude Code PR support.

## File Structure

```text
.
|-- .claude/
|   `-- commands/        # Active Claude Code commands used by workflows
|-- .github/
|   `-- workflows/       # Installed repository workflows
|-- commands/            # Custom Claude Code commands
|-- agents/              # Specialized AI agents and agent templates
|-- skills/              # Reusable skills for specialized tasks
|-- scheduled-tasks/     # Local scheduled task definitions
|-- hooks/               # Event-driven TypeScript scripts
|-- github/              # GitHub workflow templates
|   |-- workflows/       # CI/CD, Dependabot, and Claude integration workflows
|   `-- dependabot.yml   # Dependabot configuration
|-- scripts/             # Utility scripts
|-- statusline-command.sh
|-- statusline-command.ps1
|-- AGENTS.md            # Global Codex instructions
|-- CLAUDE.md            # Claude Code workspace instructions
|-- settings.json        # Claude Code workspace settings
|-- CHANGELOG.md         # Project changelog
`-- README.md            # This file
```

## Automation Features

### Command Automation

- MCP server installation and configuration
- Streamlined branching, merging, and cleanup via commands
- One-command Tailwind CSS design system setup
- Automated project structure creation
- Supabase edge function deployment with CLI setup
- Conversation learning capture into structured markdown

### Agent Automation

- Context-aware specialized agents
- API implementation guidance
- Copywriting and UI design assistance

### Skill Automation

- Notion page creation from markdown
- Browser automation and UI interaction
- Email-safe HTML conversion
- Weekly activity digest generation
- OpenShift application deployment and updates

### GitHub Integration Automation

- One-command comprehensive GitHub workflow deployment
- Weekly changelog and README updates via GitHub Actions using `cc-` prefixed commands
- Automated Dependabot updates
- Claude Code integration for automated PR reviews
- Interactive support for GitHub issues and pull requests

### Hook Automation

- Event-driven audio/visual alerts for agent state changes
- Activity logging for agent interactions and completions
- Cross-platform sound support for macOS, Windows, and Linux
- Chat transcript processing and storage

## Project Instructions

This repository includes `AGENTS.md` and `CLAUDE.md` instruction files. Together they cover:

- Plan file management
- Independent thinking and technical pushback
- Efficient file navigation and codebase exploration
- Frontend development rules
- Browser automation with `agent-browser`

## Getting Started

1. This workspace is automatically configured for Claude Code.
2. Use `/help` to see available commands.
3. Commands include built-in tool permissions and safety checks.
4. Agents are invoked automatically based on task context.
5. Review `AGENTS.md` and `CLAUDE.md` for detailed workflow instructions and best practices.
