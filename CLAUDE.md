# Global Claude Code Instructions

## Plan File Management

**CRITICAL: All plan files MUST be created in the `/plans` directory of the current project.**

### Plan File Location Rules

1. **Always create plans in:** `<project-root>/plans/`
2. **Never create plans in:** project root, temp directories, arbitrary locations, or global claude code user directory
3. **Plan file naming:** Use descriptive names with timestamps when appropriate
   - Format: `YYYY-MM-DD-<feature-description>.md`
   - Example: `2026-01-13-add-search-filters.md`

### Directory Setup

If the `/plans` directory doesn't exist:
- Create it before writing any plan files
- Add a `.gitkeep` file to ensure it's tracked in git
- Optionally add a `README.md` explaining the purpose

### Integration with EnterPlanMode

When using `EnterPlanMode` tool:
- The plan file path should ALWAYS be: `plans/<descriptive-name>.md`
- Create the directory if it doesn't exist
- Use clear, descriptive filenames that explain the task


## File Navigation

- Always `ls` to check directory structure before globbing or searching
- Avoid Task/Explore agents for simple file lookups — use Glob, Read, or `ls` directly

## Codebase Exploration Efficiency

**CRITICAL: Be token-efficient. Most codebases don't need extensive exploration.**

### Before Any Exploration

1. **Check project CLAUDE.md FIRST** - It likely has:
   - Quick file reference showing where key files are
   - Architecture documentation
   - Common workflows and patterns
   - If these are documented, trust them - don't re-explore

2. **Assess codebase size** - Use `ls` or quick Glob to gauge size
   - Small codebase (<50 files)? Use targeted Glob/Grep, minimal exploration
   - Medium codebase (50-200 files)? Check docs first, then targeted searches
   - Large codebase (200+ files)? Use Task/Explore agent with specific goals

### Efficient Exploration Pattern

**DO:**
- Start with project CLAUDE.md documentation
- Use Glob to find files by pattern before reading (e.g., `**/*types*.ts`, `**/components/*Nav*.tsx`)
- Use Grep to search for specific code patterns before reading full files
- Read type definition files FIRST for any data/API work (e.g., `types.ts`, `schema.ts`, `models.py`)
- Follow documented patterns when available
- Use parallel tool calls for independent searches

**DON'T:**
- Use Task/Explore agent for simple file lookups in small codebases
- Read all files in a directory when you need just one
- Explore blindly - leverage documentation when available
- Read files unnecessarily - if documented, trust it
- Make redundant searches - if first Grep/Glob finds it, stop searching

### Efficient Workflows by Task Type

**UI/Frontend Change:**
1. Check project docs for component locations
2. Use Glob to find specific component: `**/components/**/*Button*.tsx`
3. Read the specific file
4. Make changes

**Data/API Change:**
1. Find and read type definitions FIRST (`types.ts`, `schema.ts`, etc.)
2. Use Grep to find where types are used
3. Read relevant implementation files
4. Make changes

**Bug Fix:**
1. Use Grep to find error message or relevant code
2. Read minimal context around the issue
3. Fix the bug
4. Don't refactor surrounding code unless necessary

**New Feature:**
1. Check project docs for similar features
2. Find and read similar existing code
3. Follow established patterns
4. Implement minimally

### Token Efficiency Rules

- **Small task** (bug fix, simple change): Target 3-8 tool calls
- **Medium task** (new component, endpoint): Target 8-15 tool calls
- **Large task** (new feature, refactor): Target 15-30 tool calls
- If you're exceeding these ranges, you're likely over-exploring

### When to Use Task/Explore Agent

**Use Task/Explore agent when:**
- Codebase is large (200+ files) and poorly documented
- Task requires understanding complex cross-file patterns
- You need to research multiple architectural approaches
- Initial targeted searches failed to find what you need

**Don't use Task/Explore agent when:**
- Project CLAUDE.md documents the architecture
- Simple file lookup or code search
- Small codebase with clear structure
- You already know which file(s) to modify

## Browser Automation

Use `agent-browser` for web automation. Run `agent-browser --help` for all commands.

Core workflow:
1. `agent-browser open <url>` - Navigate to page
2. `agent-browser snapshot -i` - Get interactive elements with refs (@e1, @e2)
3. `agent-browser click @e1` / `fill @e2 "text"` - Interact using refs
4. Re-snapshot after page changes