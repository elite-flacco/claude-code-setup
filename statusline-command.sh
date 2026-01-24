#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
output_style=$(echo "$input" | jq -r '.output_style.name')

# Get git branch if in a git repo (skip optional locks)
cd "$cwd" 2>/dev/null
git_branch=$(git -c core.useBuiltinFSMonitor=false branch --show-current 2>/dev/null)

# Get basename of current directory
dir_name=$(basename "$cwd")

# Build status line
status=""

# Add git branch if available
if [ -n "$git_branch" ]; then
status="${status}(${git_branch}) "
fi

# Add directory
status="${status}${dir_name}"

# Add model (abbreviated)
model_short=$(echo "$model" | sed 's/Claude //')
status="${status} [${model_short}]"

# Add output style if not default
if [ "$output_style" != "default" ] && [ "$output_style" != "null" ]; then
status="${status} {${output_style}}"
fi

echo "$status"
