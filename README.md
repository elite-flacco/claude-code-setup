# Claude Code Workspace

A comprehensive Claude Code workspace configuration with custom commands, specialized agents, hooks, and GitHub integration for enhanced development workflows.

## Overview

This workspace provides a collection of custom commands, specialized agents, and GitHub integrations designed to streamline development workflows with Claude Code. It includes tools for git automation, design system setup, project initialization, and CI/CD workflows.

## Features

### 📁 Commands (19 available)

All commands use the `cc-` prefix for Claude Code commands:

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
- **cc-setup-design-system-tw-v4** - Tailwind CSS v4 specific design system setup
- **cc-design-mode** - Switch projects into design/prototyping mode
- **cc-add-scripts** - Add utility scripts to projects

#### Deployment Commands
- **cc-deploy-supabase-edge-function** - Deploy edge functions to Supabase with automated setup

#### GitHub Integration Commands
- **cc-add-gh-workflows** - Set up comprehensive GitHub workflows for CI/CD automation

#### Maintenance Commands
- **cc-update-readme** - Automatically update README files based on recent changes
- **cc-update-changelog** - Generate and maintain changelog entries

#### Research Commands
- **nc-company-research** - Research and analyze company information
- **nc-people-research** - Comprehensive people research for interview preparation

### 🤖 Agents (1 available)

- **openai** - Comprehensive OpenAI API implementation guidance covering Responses API, structured outputs, tool use, streaming, and realtime features

### ⚡ Hooks (3 available)

- **notification.ts** - Logs notifications and plays sound/speech alerts when agents need attention
- **stop.ts** - Handles agent completion events with sound notifications and chat transcript processing
- **subagent_stop.ts** - Manages subagent completion notifications with cross-platform sound support

### 🔗 GitHub Integration & Workflows (5 workflows)

#### CI/CD Workflows
- **ci.yml** - Continuous integration with Node.js testing and build automation
- **auto-merge-dependabot.yml** - Automated dependency updates with auto-merge capabilities

#### Claude Code Integration Workflows
- **cc-assistant.yml** - Interactive GitHub support with Claude Code integration
- **cc-auto-review.yml** - Automated pull request reviews using Claude Code
- **changelogbot.yml** - Automated changelog and README updates on weekly schedule using `cc-` prefixed commands

## Recent Updates

### v0.6.1 - 2025-12-07
- ✨ Added `nc-people-research` command for comprehensive interview preparation

### v0.6.0 - 2025-12-02
- ♻️ Standardized command naming with `cc-` prefix for all Claude Code commands
- 🔧 Updated changelogbot workflow to use new command naming convention (`cc-update-changelog`, `cc-update-readme`)
- ✨ Added new commands: `cc-show-prs`, `cc-add-scripts`, and `nc-company-research`

### v0.5.0 - 2025-09-07
- 🚀 Added GitHub workflow automation with weekly changelog and README updates

### v0.4.0 - 2025-08-28
- ✨ Added GitHub workflows command for automated CI/CD setup
- ✨ Comprehensive GitHub workflow templates including:
  - CI/CD pipeline with Node.js testing and build
  - Dependabot configuration with auto-merge capabilities  
  - Claude Code integration workflows for automated PR reviews
  - Claude assistant workflow for interactive GitHub support
- 📝 Updated commands instructions and tool permissions

### v0.3.0 - 2025-08-25
- ✨ Added OpenAI agent with comprehensive API playbook for modern OpenAI development
- ✨ Added Supabase edge function deployment command with automated CLI setup
- 📝 Enhanced project documentation and changelog maintenance

### v0.2.0 - 2025-08-23
- ✨ Added git worktree command definitions with proper tool permissions
- 📝 Enhanced commit command documentation with comprehensive checks
- ✨ Comprehensive design system setup commands for modern web development

### v0.1.0 - 2025-08-08
- 🔧 MCP server installation automation (playwright, context7)
- 🎉 Initial Claude Code workspace setup with project structure

## Design System

The workspace includes a sophisticated design system setup that provides:
- **Tailwind CSS integration** with CSS variables as the single source of truth
- **Dark mode support** via class-based switching
- **Comprehensive component library** (buttons, cards, forms, badges)
- **Accessibility-first approach** with reduced motion respect
- **Scalable token system** for colors, typography, and spacing

## Usage

### Commands
Available via Claude Code's slash command interface:
```
/cc-create-worktree feature-branch-name
/cc-setup-design-system
/cc-add-gh-workflows
/cc-update-readme
/cc-commit
```

### Agents
Automatically invoked by Claude Code when working on relevant tasks or can be explicitly requested for specialized assistance.

### Hooks
Event-driven TypeScript scripts that automatically execute on Claude Code events:
- Provide audio/visual notifications for agent states
- Log agent activities for monitoring and debugging  
- Cross-platform sound support (macOS, Windows, Linux)

### GitHub Workflows
Automatically deployed when using `/cc-add-gh-workflows` command. Includes comprehensive CI/CD automation and Claude Code integration.

## File Structure

```
.
├── .claude/
│   └── commands/        # Active Claude Code command (used by workflows)
├── commands/            # Custom Claude Code commands (19 available, cc- prefixed)
├── agents/             # Specialized AI agents (1 available)
├── hooks/              # Event-driven TypeScript scripts (3 available)
├── github/             # GitHub workflow templates
│   ├── workflows/      # CI/CD, Dependabot, and Claude integration workflows (5 available)
│   └── dependabot.yml  # Dependabot configuration
├── scripts/            # Utility scripts
├── settings.json       # Claude Code workspace settings
├── CHANGELOG.md        # Project changelog
└── README.md           # This file
```

## Automation Features

### Command Automation
- **MCP Server Integration** - Automated installation and configuration of MCP servers
- **Git Workflow Automation** - Streamlined branching, merging, and cleanup via commands
- **Design System Generation** - One-command Tailwind CSS design system setup
- **Project Initialization** - Automated project structure creation
- **Supabase Deployment** - Automated edge function deployment with CLI setup

### Agent Automation  
- **Context-Aware Assistance** - Specialized agents automatically invoked based on task context
- **API Implementation** - OpenAI integration best practices and code generation

### GitHub Integration Automation
- **CI/CD Pipeline Setup** - One-command comprehensive GitHub workflow deployment
- **Weekly Maintenance** - Scheduled changelog and README updates via GitHub Actions using `cc-` prefixed commands
- **Dependency Management** - Automated Dependabot updates with auto-merge
- **Code Review Automation** - Claude Code integration for automated PR reviews
- **Interactive Support** - Claude assistant workflow for GitHub issue and PR support

### Hook Automation
- **Event-Driven Notifications** - Automatic audio/visual alerts for agent state changes
- **Activity Logging** - Comprehensive logging of agent interactions and completions
- **Cross-Platform Sound Support** - Notification sounds for macOS, Windows, and Linux
- **Chat Transcript Processing** - Automatic processing and storage of conversation transcripts

## Getting Started

1. This workspace is automatically configured for Claude Code
2. Use `/help` to see available commands
3. Commands include built-in tool permissions and safety checks
4. Agents are invoked automatically based on task context
