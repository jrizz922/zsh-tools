#!/bin/zsh
fswatch -o $HOME/.zshrc $HOME/.zsh/ | xargs -n1 zsh $DIR_PATH/commit_changes.sh
