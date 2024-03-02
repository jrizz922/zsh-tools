#!/bin/bash

# Function to search for zsh configuration files
search_zsh_config_files() {
    config_files=(~/.zshrc ~/.zshenv ~/.zprofile ~/.zlogin ~/.zlogout)

    for file in "${config_files[@]}"; do
        if [ -f "$file" ]; then
            echo "Found zsh configuration file: $file"
        fi
    done
}

# Function to search for bash configuration files
search_bash_config_files() {
    config_files=(~/.bashrc ~/.bash_profile)

    for file in "${config_files[@]}"; do
        if [ -f "$file" ]; then
            echo "Found bash configuration file: $file"
        fi
    done
}

# Function to check if zsh is installed
check_zsh_installation() {
    if which zsh >/dev/null 2>&1; then
        echo "zsh is installed on the system."
        echo "Searching for zsh configuration files..."
        search_zsh_config_files
    else
        echo "zsh is not installed on the system."
        read -p "Would you like to continue using bash? (y/n): " choice
        if [[ $choice == "y" || $choice == "Y" ]]; then
            echo "Searching for bash configuration files..."
            search_bash_config_files
        fi
        echo "Exiting."
        exit 1
    fi
}

# Call the function to check zsh installation and search for configuration files
check_zsh_installation


# Function to check if brew is installed
check_brew_installation() {
    if ! which brew > /dev/null 2>&1; then
        echo "brew is not installed. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "brew is installed on the system."
    fi
}

# Function to check if rsync is installed
check_rsync_installation() {
    if ! brew list rsync > /dev/null 2>&1; then
        echo "rsync is not installed. Installing..."
        brew install rsync
    else
        echo "rsync is installed on the system."
    fi
}

# Call the functions
check_brew_installation
check_rsync_installation
    