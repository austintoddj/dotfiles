# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=$(tty)
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/Sites/dev-setup/scripts:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/todd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Go to the Sites Directory
alias s='cd ~/Sites'

# Go to the Desktop
alias dt='cd ~/Desktop'

# Preferred 'cp' implementation
alias cp='cp -iv'

# Preferred 'mv' implementation
alias mv='mv -iv'

# Remove default alias / Preferred 'ls' implementation
unalias ll
alias ll='ls -la'

# Preferred 'cat' implementation
cat() { bat "$@" ; }

# Opens any file in sublime editor
alias edit='subl'

# Opens current directory in macOS Finder
alias f='open -a Finder ./'

# Clear terminal display
alias c='clear'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Pipe content to file on MacOS Desktop
alias DT='tee $HOME/Desktop/terminalOut.txt'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Moves a file to the macOS trash
trash() { command mv "$@" $HOME/.Trash ; }

# Remove default alias / Make a directory and enter it
unalias md
md() { mkdir -p "$@" && cd "$@" ; }

# Remove default alias / Remove a directory and its files
unalias rd
rd() { rm -rf "$@" ; }

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# To create a ZIP archive of a folder
zipf() { zip -r "$1".zip "$1" ; }

# Count of non-hidden files in current dir
alias numFiles='echo $(ls -1 | wc -l)'

# Extract most know archives with one command
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Quickly search for file
alias qfind="find . -name "

# Find file under the current directory
ff () { /usr/bin/find . -name "$@" ; }

# Find file whose name starts with a given string
ffs() { /usr/bin/find . -name "$@"'*' ; }

# Find file whose name ends with a given string
ffe() { /usr/bin/find . -name '*'"$@" ; }

# Search for a file using macOS Spotlight's metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# Find out the pid of a specified process
findPid() { lsof -t -c "$@" ; }

# Find memory hogs
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# Find CPU hogs
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Continual 'top' listing (every 10 seconds)
alias topForever='top -l 9999999 -s 10 -o cpu'

# Recommended 'top' invocation to minimize resources
alias ttop="top -R -F -s 10 -o rsize"

# List processes owned by my user
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# Public facing IP Address
alias myip='curl https://ipinfo.io/ip'

# Display system and network info
alias sys='ii && neofetch'

# Show all open TCP/IP sockets
alias netCons='lsof -i'

# Flush out the DNS Cache
alias flushDNS='dscacheutil -flushcache'

# Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'

# Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'

# Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'

# Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'

# Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'

# All listening connections
alias openPorts='sudo lsof -i | grep LISTEN'

# All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'

# Display useful host related information
ii() {
    echo -e "\n${COL_GREEN}You are currently logged in to:$COL_RESET " ; echo -e $HOSTNAME
    echo -e "\n${COL_GREEN}Additional information:$COL_RESET $NC " ; uname -a
    echo -e "\n${COL_GREEN}Users logged on:$COL_RESET $NC " ; w -h
    echo -e "\n${COL_GREEN}Current date:$COL_RESET $NC " ; date
    echo -e "\n${COL_GREEN}Machine stats:$COL_RESET $NC " ; uptime
    echo -e "\n${COL_GREEN}Current network location:$COL_RESET $NC " ; scselect
    echo -e "\n${COL_GREEN}Public facing IP Address:$COL_RESET $NC " ; myip
    echo
}

# Recursively delete .DS_Store files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Laravel
alias wipe='php artisan clear-compiled;php artisan view:clear;php artisan cache:clear;php artisan config:clear;php artisan route:clear;composer dumpautoload'
alias pu='vendor/bin/phpunit'

# Composer
composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}
