# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.5.1] - 2025-11-23

### Fixed
- README workflow and agent count accuracy in documentation

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