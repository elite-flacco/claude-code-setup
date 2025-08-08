#!/bin/bash

# Array of servers: "name:path:scope"
SERVERS=(
    "playwright:@playwright/mcp@latest:user"
    "context7:@upstash/context7-mcp@latest:user"
)

for server_config in "${SERVERS[@]}"; do
    IFS=':' read -r name path scope <<< "$server_config"
    
    echo "Adding server: $name (scope: $scope)"
    claude mcp add "$name" --scope "$scope" -- cmd "//c" "npx" "$path"
    
    if [ $? -eq 0 ]; then
        echo "✅ $name added successfully"
    else
        echo "❌ Failed to add $name"
    fi
    echo "---"
done