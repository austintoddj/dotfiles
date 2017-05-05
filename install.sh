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

echo "------------------------------------------------"
echo -e $COL_YELLOW"Setting up your macOS development environment..."$COL_RESET
echo "------------------------------------------------"

# Include the base elements script
./base.sh

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to an empty page for faster loading
defaults write com.apple.Safari HomePage -string ""

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in "Finder" "Safari"; do
    killall "${app}" > /dev/null 2>&1
done

# Stop the timer
end_time=$(date +%s)

echo -e $COL_GREEN"Finished in `expr $end_time - $start_time`s."$COL_RESET

