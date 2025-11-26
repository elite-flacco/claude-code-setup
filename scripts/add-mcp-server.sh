#!/bin/bash

# Load environment variables from .env file if it exists
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

if [ -f "$ENV_FILE" ]; then
    echo "Loading environment variables from .env file..."
    set -a  # automatically export all variables
    source "$ENV_FILE"
    set +a
else
    echo "No .env file found at $ENV_FILE - proceeding without custom env vars"
fi

# Array of servers: "name:path:scope" or "name:path:scope:ENV_VAR1,ENV_VAR2"
# Environment variable names (not values!) - actual values come from .env file
# Examples:
#   "playwright:@playwright/mcp@latest:user"
#   "context7:@upstash/context7-mcp@latest:user:UPSTASH_REDIS_URL,UPSTASH_REDIS_TOKEN"
SERVERS=(
    "playwright:@playwright/mcp@latest:user"
    "context7:@upstash/context7-mcp@latest:user"
    "notion:@notionhq/notion-mcp-server@latest:user:NOTION_TOKEN"
)

for server_config in "${SERVERS[@]}"; do
    IFS=':' read -r name path scope env_vars <<< "$server_config"

    echo "Adding server: $name (scope: $scope)"

    # Build the command with optional env vars
    cmd_args=("claude" "mcp" "add" "$name" "--scope" "$scope")

    # Add environment variables if specified
    if [ -n "$env_vars" ]; then
        IFS=',' read -ra ENV_ARRAY <<< "$env_vars"
        for env_name in "${ENV_ARRAY[@]}"; do
            env_name=$(echo "$env_name" | xargs)  # trim whitespace
            env_value="${!env_name}"  # indirect variable expansion

            if [ -z "$env_value" ]; then
                echo "  ⚠️  Warning: $env_name is not set"
            else
                cmd_args+=("--env" "$env_name=$env_value")
                echo "  ↳ Setting env: $env_name"
            fi
        done
    fi

    # Add the command portion
    cmd_args+=("--" "cmd" "//c" "npx" "$path")

    # Execute the command
    "${cmd_args[@]}"

    if [ $? -eq 0 ]; then
        echo "✅ $name added successfully"
    else
        echo "❌ Failed to add $name"
    fi
    echo "---"
done