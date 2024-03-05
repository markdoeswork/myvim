#!/bin/bash

# Path to the original and the one to merge
ORIGINAL_VIMRC="$HOME/.vimrc"
MERGE_VIMRC="$HOME/myvim/.vimrc"

# Temporary file to store unique lines
TEMP_FILE=$(mktemp)

# Check each line of MERGE_VIMRC against ORIGINAL_VIMRC
while IFS= read -r line; do
    if ! grep -Fxq "$line" "$ORIGINAL_VIMRC"; then
        echo "$line" >> "$TEMP_FILE"
    fi
done < "$MERGE_VIMRC"

# Append unique lines to ORIGINAL_VIMRC
if [ -s "$TEMP_FILE" ]; then
    cat "$TEMP_FILE" >> "$ORIGINAL_VIMRC"
fi

# Clean up temporary file
rm "$TEMP_FILE"
