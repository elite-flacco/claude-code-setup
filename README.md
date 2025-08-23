# Claude Code Workspace

A comprehensive Claude Code workspace configuration with custom commands, specialized agents, and design system setup tools.

## Overview

This workspace provides a collection of custom commands and agents designed to enhance development workflows with Claude Code. It includes tools for git workflow automation, design system setup, and project initialization.

## Features

### Git Workflow Commands
- **create-worktree** - Create git worktrees for parallel feature development
- **remove-worktree** - Clean up git worktrees when branches are done
- **create-worktrees-for-pr** - Set up worktrees specifically for pull request workflows
- **create-pr** - Automated pull request creation with proper formatting
- **merge-branch** - Streamlined branch merging with cleanup
- **clean-branches** - Remove stale local and remote branches
- **commit** - Enhanced commit command with comprehensive checks

### Project Setup Commands
- **init-project** - Initialize new projects with standardized structure
- **setup-design-system** - Create comprehensive Tailwind CSS design systems
- **setup-design-system-tw-v4** - Tailwind CSS v4 specific design system setup
- **design-mode** - Switch projects into design/prototyping mode

### Maintenance Commands
- **update-readme** - Automatically update README files based on recent changes
- **add-changelog** - Generate and maintain changelog entries

## Recent Updates

### v0.1.0 - 2025-08-08
- ✨ Added git worktree command definitions with proper tool permissions
- 📝 Enhanced commit command documentation with comprehensive checks
- ✨ Comprehensive design system setup commands for modern web development
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

Commands are available via Claude Code's slash command interface:
```
/create-worktree feature-branch-name
/setup-design-system
/update-readme
```

Agents can be invoked through Claude Code's agent system when working on relevant tasks.

## File Structure

```
.claude/
├── commands/          # Custom Claude Code commands
├── agents/           # Specialized AI agents
├── CHANGELOG.md      # Project changelog
└── README.md         # This file
```

## Automation Features

- **MCP Server Integration** - Automated installation and configuration
- **Git Workflow Automation** - Streamlined branching and merging
- **Design System Generation** - One-command design system setup
- **Documentation Maintenance** - Automated README and changelog updates

## Getting Started

1. This workspace is automatically configured for Claude Code
2. Use `/help` to see available commands
3. Commands include built-in tool permissions and safety checks
4. Agents are invoked automatically based on task context
