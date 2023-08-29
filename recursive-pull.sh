#!/bin/bash

function git_pull_recursive {
    local dir="$1"
    
    # Iterate through each subdirectory in the given directory
    for sub_dir in "$dir"/*/; do
        if [ -d "$sub_dir/.git" ]; then
            echo "Updating $sub_dir"
            (cd "$sub_dir" && git pull)
            echo "-------------------------------------"
        fi
        
        # Recursively call the function for subdirectories
        git_pull_recursive "$sub_dir"
    done
}

# Start the recursive traversal from the current directory
git_pull_recursive .

echo "Git pull in all directories completed."
