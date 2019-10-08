# Define color variables for output
ESC_SEQ="\x1b["
COL_RED=$ESC_SEQ"31;01m"
COL_CYAN=$ESC_SEQ"36;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_RESET=$ESC_SEQ"39;49;00m"

# Set Paths
export GPG_TTY=$(tty)
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/Sites/dev-setup/scripts:$PATH"

# Change Prompt
source $HOME/.git-prompt.sh
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

if [ -f $HOME/.git-completion.bash ]; then
    . $HOME/.git-completion.bash
fi

# Set Default Editor (change 'Vim' to the editor of your choice)
export EDITOR=/usr/bin/vim

# Set default blocksize for ls, df, du
export BLOCKSIZE=1k

# Set Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Go back 1 directory level
alias ..='cd ../'

# Go back 2 directory levels
alias ...='cd ../../'

# Go back 3 directory levels
alias .3='cd ../../../'

# Go back 4 directory levels
alias .4='cd ../../../../'

# Go back 5 directory levels
alias .5='cd ../../../../../'

# Go back 6 directory levels
alias .6='cd ../../../../../../'

# Go to the Home Directory
alias ~='cd ~'

# Go to the Sites Directory
alias s='cd ~/Sites'

# Go to the Desktop
alias dt='cd ~/Desktop'

# Preferred 'cp' implementation
alias cp='cp -iv'

# Preferred 'mv' implementation
alias mv='mv -iv'

# Preferred 'ls' implementation
alias ll='ls -FGlAhp'

# Preferred 'cat' implementation
cat() { bat "$@" ; }

# Opens any file in sublime editor
alias edit='subl'

# Opens current directory in macOS Finder
alias f='open -a Finder ./'

# Clear terminal display
alias c='clear'

# Find executables
alias which='type -all'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Display bash options settings
alias show_options='shopt'

# Pipe content to file on MacOS Desktop
alias DT='tee $HOME/Desktop/terminalOut.txt'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Moves a file to the macOS trash
trash () { command mv "$@" $HOME/.Trash ; }

# Make a directory and enter it
md() { mkdir -p "$@" && cd "$@" ; }

# Remove a directory and its files
rd() { rm -rf "$@" ; }

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# To create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }

# Count of non-hidden files in current dir
alias numFiles='echo $(ls -1 | wc -l)'

# Extract most know archives with one command
extract () {
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
ffs () { /usr/bin/find . -name "$@"'*' ; }

# Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

# Search for a file using macOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# Find out the pid of a specified process
findPid () { lsof -t -c "$@" ; }

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
