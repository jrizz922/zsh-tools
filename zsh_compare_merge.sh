#!/bin/bash

# Search for .zshrc file in the user's home directory
zshrc_file="$HOME/.zshrc"

if [ -f "$zshrc_file" ]; then
    echo "Found .zshrc file in $HOME directory."

    # Compare .zshrc file with secure_zshrc file
    if diff -q "$zshrc_file" secure_zshrc >/dev/null; then
        echo "No differences found between .zshrc and secure_zshrc files."
    else
        echo "Differences found between .zshrc and secure_zshrc files."

        # Ask user if they want to merge the enhanced security functionality
        read -p "Do you want to merge the enhanced security functionality into your .zshrc configuration? (y/n): " choice

        if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
            # Make a backup of the original .zshrc file
            cp "$zshrc_file" "$zshrc_file.bak"

            # Merge the original .zshrc file with the secure_zshrc file
            cat secure_zshrc >> "$zshrc_file"

            echo "Enhanced security functionality merged into .zshrc configuration."
        else
            echo "Enhanced security functionality not merged."
        fi
    fi
else
    echo "No .zshrc file found in $HOME directory."
fi