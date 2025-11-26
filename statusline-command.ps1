# Read JSON input from stdin
$input_json = [Console]::In.ReadToEnd()

try {
    $data = $input_json | ConvertFrom-Json
} catch {
    Write-Output "Error parsing JSON"
    exit 1
}

# Extract data from JSON
$cwd = $data.workspace.current_dir
$model = $data.model.display_name
$output_style = $data.output_style.name

# Get git branch if in a git repo
Push-Location $cwd -ErrorAction SilentlyContinue
$git_branch = git branch --show-current 2>$null
Pop-Location

# Get basename of current directory
$dir_name = Split-Path -Leaf $cwd

# Build status line
$status = ""

# Add git branch if available
if ($git_branch) {
    $status += "($git_branch) "
}

# Add directory
$status += $dir_name

# Add model (abbreviated)
$model_short = $model -replace "Claude ", ""
$status += " [$model_short]"

# Add output style if not default
if ($output_style -and $output_style -ne "default" -and $output_style -ne "null") {
    $status += " {$output_style}"
}

Write-Output $status
