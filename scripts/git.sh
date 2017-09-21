#!/usr/bin/env bash

echo -e "Updating your Git setup and configuration..."

[ -f ~/.gitignore ] && cp -rf .gitignore ~/.gitignore || cp .gitignore ~/.gitignore
[ -f ~/.gitconfig ] && cp -rf .gitconfig ~/.gitconfig || cp .gitconfig ~/.gitconfig
[ -f ~/.git-prompt.sh ] && cp -rf .git-prompt.sh ~/.git-prompt.sh || cp .git-prompt.sh ~/.git-prompt.sh
