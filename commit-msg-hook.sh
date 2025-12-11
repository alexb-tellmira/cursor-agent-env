#!/bin/bash
# commit-msg hook: Removes Co-authored-by lines from commit messages
# This is useful when you don't want AI assistant attribution in commits

COMMIT_MSG_FILE="$1"

if [[ -f "$COMMIT_MSG_FILE" ]]; then
    # Remove lines starting with "Co-authored-by:" (case-insensitive)
    # Also handles lines with leading whitespace
    sed -i.bak -E '/^[[:space:]]*[Cc]o-authored-by:/d' "$COMMIT_MSG_FILE"
    rm -f "${COMMIT_MSG_FILE}.bak"
fi
