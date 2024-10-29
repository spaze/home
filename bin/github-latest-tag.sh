#!/bin/bash

# Echo latest tag for a GitHub repository
# Removes the leading "v" if any (if there's a tag v1.2, only 1.2 will be echoed)

if ! hash jq 2>/dev/null; then
    echo "jq is required but it's not installed"
    exit 100
fi

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <repository>, example: $0 foo/bar"
    exit 1
fi

REPO=$1

if [[ ! "$REPO" =~ ^[a-zA-Z0-9-]+/[a-zA-Z0-9-]+$ ]]; then
    echo "Repository $REPO name not valid"
    exit 2
fi

if ! LATEST=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq .tag_name --raw-output --exit-status); then
    echo "No tag detected for $REPO"
    exit 3
fi

echo "${LATEST/#v/}"
