# Claude Code Workspace

A comprehensive Claude Code workspace configuration with custom commands, specialized agents, hooks, and GitHub integration for enhanced development workflows.

## Overview

This workspace provides a collection of custom commands, specialized agents, and GitHub integrations designed to streamline development workflows with Claude Code. It includes tools for git automation, design system setup, project initialization, and CI/CD workflows.

## Features

### 📁 Commands (21 available)

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

#### Utility Commands

- **cc-explain-to-me** - Explain error messages in plain, technically accurate language

#### Research Commands

- **nc-company-research** - Research and analyze company information
- **nc-people-research** - Comprehensive people research for interview preparation

### 🤖 Agents (1 available)

- **openai** - Comprehensive OpenAI API implementation guidance covering Responses API, structured outputs, tool use, streaming, and realtime features

### 🎨 Skills (16 available)

- **agent-browser** - Browser automation and web interaction capabilities for agents
- **design-inspirations** - Create multiple visual variations of UI components
- **fluid-typography** - Create responsive, fluid typography systems using CSS clamp() with mathematically precise scaling
- **n8n-code-javascript** - JavaScript code generation and best practices for n8n workflow automation
- **n8n-code-python** - Python code generation and best practices for n8n workflow automation
- **n8n-expression-syntax** - n8n expression syntax and data transformation patterns
- **n8n-mcp-tools-expert** - n8n MCP (Model Context Protocol) tools integration expertise
- **n8n-node-configuration** - n8n node configuration and workflow building guidance
- **n8n-validation-expert** - n8n workflow validation and error handling best practices
- **n8n-workflow-patterns** - Common n8n workflow patterns and automation strategies
- **remotion-best-practices** - Comprehensive Remotion video framework best practices covering 3D, animations, assets, audio, captions, charts, fonts, timing, and more
- **skill-creator** - Tools and templates for creating new custom skills
- **supabase-postgres-best-practices** - PostgreSQL and Supabase best practices for performance, security, indexing, connection management, and query optimization
- **theme-toggle-creator** - Set up dark mode/theme toggle in Next.js applications with next-themes integration
- **vercel-react-best-practices** - React and Next.js performance optimization covering rendering, async operations, bundling, client-side patterns, and server components
- **web-design-guidelines** - Comprehensive web design principles and guidelines

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

### v0.7.0 - 2026-01-26
- ✨ Added n8n skills suite for workflow automation (7 skills covering JavaScript, Python, expressions, MCP tools, node configuration, validation, and workflow patterns)
- ✨ Added `design-inspirations` skill for creating multiple visual variations of UI components
- ✨ Added `skill-creator` skill for guiding the creation of effective Claude Code skills
- ✨ Added `supabase-postgres-best-practices` skill for Postgres performance optimization
- ✨ Added `remotion-best-practices` skill for React video creation with Remotion
- ✨ Added `web-design-guidelines` skill for UI code review against Web Interface Guidelines
- ✨ Added `vercel-react-best-practices` skill for React/Next.js performance optimization
- ✨ Added `agent-browser` skill for web automation using browser CLI tool
- 📝 Updated README to reflect all available skills documentation

### v0.6.5 - 2026-01-18
- ✨ Added `fluid-typography` skill for implementing responsive typography with CSS clamp()
- ✨ Added `theme-toggle-creator` skill for adding dark mode to Next.js applications using next-themes

### v0.6.4 - 2026-01-11
- 🔧 Enhanced Dependabot configuration with ESLint package grouping for better dependency management

### v0.6.3 - 2025-12-15
- ✨ Added `cc-explain-to-me` command for explaining error messages in plain, technically accurate language
- ✨ Added `cc-add-theme-toggle` command for Next.js dark mode/theme toggle using next-themes
- ✨ Enhanced `cc-add-scripts` command with additional utility script options

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

### Skills

Reusable capabilities that can be invoked via slash commands for specialized tasks including:
- Typography systems and theme toggles
- Video production with Remotion
- PostgreSQL/Supabase optimization
- React/Next.js performance best practices
- Browser automation
- Custom skill creation
- n8n workflow automation (7 specialized skills)
- UI design patterns and variations
- Web design guidelines and best practices

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
├── commands/            # Custom Claude Code commands (21 available, cc- prefixed)
├── agents/             # Specialized AI agents (1 available)
├── skills/             # Reusable skills for specialized tasks (16 available)
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
