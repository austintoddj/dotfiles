#!/usr/bin/env bash

# Set the timer
start_time=$(date +%s)

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

# Execute the base scripts
SHELL_FILES=./Shell/*
for f in $SHELL_FILES; do
    filename=$(basename "$f")
    ./$f
done

# Stop the timer
end_time=$(date +%s)

echo -e $COL_GREEN"✔ Finished in `expr $end_time - $start_time` seconds."$COL_RESET