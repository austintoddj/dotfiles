#!/usr/bin/env bash

# Set the timer
START_TIME=$(date +%s)

# Define color variables for output
ESC_SEQ="\x1b["
COL_RED=$ESC_SEQ"31;01m"
COL_CYAN=$ESC_SEQ"36;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_RESET=$ESC_SEQ"39;49;00m"

echo "----------------------------------------------"
echo -e $COL_YELLOW"Updating your macOS development environment..."$COL_RESET
echo "----------------------------------------------"

###############################################################################
# Shell Scripts                                                               #
###############################################################################

# Back up files before replacement
mkdir -pv ~/.dev-backups

cp -r ~/.vim ~/.dev-backups/.vim
cp -rf ~/.vimrc ~/.dev-backups/.vimrc
cp -rf ~/.bashrc ~/.dev-backups/.bashrc
cp -rf ~/.curlrc ~/.dev-backups/.curlrc
cp -rf ~/.gitconfig ~/.dev-backups/.gitconfig
cp -rf ~/.gitignore ~/.dev-backups/.gitignore
cp -rf ~/.bash_profile ~/.dev-backups/.bash_profile
cp -rf ~/.git-prompt.sh ~/.dev-backups/.git-prompt.sh

# Execute the base scripts
SHELL_SCRIPTS=./scripts/*
for f in $SHELL_SCRIPTS; do
    filename=$(basename "$f")
    ./$f
done

echo ""
echo -e "File backups have been created and can be accessed at $COL_YELLOW~/.dev-backups$COL_RESET"
echo ""

# Stop the timer
END_TIME=$(date +%s)

echo "------------------------------------------------"
echo -e $COL_GREEN"✔ Finished.$COL_RESET (`expr $END_TIME - $START_TIME`s)"
echo "------------------------------------------------"
