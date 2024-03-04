#!/bin/bash

# Function to search for configuration files
search_config_files() {
    local config_files=("$@")

    for file in "${config_files[@]}"; do
        if [ -f "$file" ]; then
            echo "Found configuration file: $file"
        fi
    done
}

# Function to check if a command is installed
check_command_installation() {
    local command_name=$1

    if which "$command_name" >/dev/null 2>&1; then
        echo "$command_name is installed on the system."
        echo "Searching for configuration files..."
        search_config_files "$@"
    else
        echo "$command_name is not installed on the system."
        read -p "Would you like to continue? (y/n): " choice
        if [[ $choice == "y" || $choice == "Y" ]]; then
            echo "Searching for configuration files..."
            search_config_files "$@"
        fi
        echo "Exiting."
        exit 1
    fi
}

# Call the function to check zsh installation and search for configuration files
check_command_installation "zsh" ~/.zshrc ~/.zshenv ~/.zprofile ~/.zlogin ~/.zlogout

# Function to check if brew is installed
check_command_installation "brew"

# Function to check if rsync is installed
check_command_installation "rsync"

# Call the functions
check_command_installation "rsync"
