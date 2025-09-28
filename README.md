# Claude Code Setup

A minimal Claude Code workspace configuration with basic setup and automation commands.

## Overview

This workspace provides a foundational setup for Claude Code with essential configuration files and a command for maintaining project documentation.

## Features

### 📁 Commands (1 available)

- **update-readme** - Automatically update README files based on recent changes and create pull requests

### ⚡ Hooks (3 configured)

This workspace includes hooks configuration that references external TypeScript scripts for:
- **Notification** - Handles agent notification events
- **Stop** - Processes agent completion events
- **SubagentStop** - Manages subagent completion notifications

*Note: Hook scripts are configured to run from external locations and are not included in this repository.*

## Recent Updates

### v1.0.0 - 2025-09-28
- 📝 Updated README to accurately reflect current workspace state
- 🔧 Corrected feature descriptions to match actual available components

### Previous Versions
- 🚀 Initial setup with comprehensive workspace descriptions
- 🎉 Basic Claude Code configuration established

## Usage

### Commands
Available via Claude Code's slash command interface:
```
/update-readme [--create-pr]
```

The `update-readme` command will analyze recent changes and update this README file accordingly. When used with the `--create-pr` flag, it will also create a pull request with the changes.

### Hooks
This workspace includes hooks configuration in `settings.json` that handle:
- **Notification events** - External script for agent notifications
- **Stop events** - External script for agent completion processing
- **Subagent stop events** - External script for subagent completion handling

*Note: The actual hook scripts are referenced from external locations and execute automatically based on Claude Code events.*

## File Structure

```
├── .claude/
│   └── commands/
│       └── update-readme.md    # README maintenance command
├── settings.json               # Claude Code workspace settings with hooks configuration
└── README.md                   # This file
```

## Configuration

### Permissions
The workspace includes pre-configured permissions for:
- **Development commands** - npm scripts for dev, build, lint, test, typecheck, format
- **Git operations** - Basic git commands (checkout, add, log) with reset protection
- **MCP Playwright integration** - Browser automation capabilities
- **Environment protection** - Prevents reading/writing sensitive .env files

### Hooks Configuration
Hooks are configured to run external TypeScript scripts that provide:
- Audio/visual notifications for Claude Code events
- Chat transcript processing and logging
- Cross-platform compatibility

## Getting Started

1. This workspace is ready to use with Claude Code
2. Use `/update-readme` to maintain documentation
3. Hooks will automatically handle notifications and event processing
4. The configuration includes safety measures to protect sensitive files
