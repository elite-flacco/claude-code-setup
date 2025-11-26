# Show Open Pull Requests

This command pulls all open PRs on a given repo or all your repos.

## Usage

To pull PRs on the repo in the current working directory, just type:
```
/cc-show-prs
```

Or with options to show PRs on all repos owned by you:
```
/cc-show-prs --all
```

## Instructions

When specified with `--all`, get all open PRs on all repos owned by the user, regardless of the PR author. Otherwise show open PRs on the current repo only.