#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Server Security & Cleanup
#  10.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

# Define color variables for output
ESC_SEQ="\x1b["
COL_RED=$ESC_SEQ"31;01m"
COL_CYAN=$ESC_SEQ"36;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_RESET=$ESC_SEQ"39;49;00m"

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

    #   Set Paths
    #   ------------------------------------------------------------
    export PATH="~/.composer/vendor/bin:$PATH"
    export PATH="~/Sites/dev-setup/scripts:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export GPG_TTY=$(tty)

    #   Change Prompt
    #   ------------------------------------------------------------
    source ~/.git-prompt.sh
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

    if [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
    fi

    #   Set Default Editor (change 'Vim' to the editor of your choice)
    #   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

    #   Set default blocksize for ls, df, du
    #   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
    #   ------------------------------------------------------------
    export BLOCKSIZE=1k

    #   Set Colors
    #   ------------------------------------------------------------
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
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

    #   Easier Navigation
    #   ------------------------------------------
    alias ..='cd ../'                           # ..:   Go back 1 directory level
    alias ...='cd ../../'                       # ...:  Go back 2 directory levels
    alias .3='cd ../../../'                     # .3:   Go back 3 directory levels
    alias .4='cd ../../../../'                  # .4:   Go back 4 directory levels
    alias .5='cd ../../../../../'               # .5:   Go back 5 directory levels
    alias .6='cd ../../../../../../'            # .6:   Go back 6 directory levels
    alias ~="cd ~"                              # ~:    Go to the Home Directory
    alias s="cd ~/Sites"                        # s:    Go to the Sites Directory
    alias dt="cd ~/Desktop"                     # dt:   Go to the Desktop

    alias cp='cp -iv'                           # Preferred 'cp' implementation
    alias mv='mv -iv'                           # Preferred 'mv' implementation
    alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
    cat() { bat "$@" ; }                        # Preferred 'cat' implementation
    alias edit='subl'                           # edit:         Opens any file in sublime editor
    alias f='open -a Finder ./'                 # f:            Opens current directory in macOS Finder
    alias c='clear'                             # c:            Clear terminal display
    alias which='type -all'                     # which:        Find executables
    alias path='echo -e ${PATH//:/\\n}'         # path:         Print each PATH entry on a separate line
    alias show_options='shopt'                  # show_options: Display bash options settings
    alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
    alias sudo='sudo '                          # sudo:         Enable aliases to be sudo’ed

    trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the macOS trash
    md() { mkdir -p "$@" && cd "$@" ; }         # Make a directory and enter it
    rd() { rm -rf "$@" ; }                      # Remove a directory and its files

    #   afk: Lock the screen (when going AFK)
    #   ------------------------------------------
    alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    #   lr: Full Recursive Directory Listing
    #   ------------------------------------------
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

    zipf () { zip -r "$1".zip "$1" ; }          # zipf:     To create a ZIP archive of a folder
    alias numFiles='echo $(ls -1 | wc -l)'      # numFiles: Count of non-hidden files in current dir

    #   extract:  Extract most know archives with one command
    #   ---------------------------------------------------------
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

#   ---------------------------
#   4. SEARCHING
#   ---------------------------

    alias qfind="find . -name "                 # qfind: Quickly search for file
    ff () { /usr/bin/find . -name "$@" ; }      # ff:    Find file under the current directory
    ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:   Find file whose name starts with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:   Find file whose name ends with a given string

    #   spotlight: Search for a file using macOS Spotlight's metadata
    #   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

    #   findPid: Find out the pid of a specified process
    #   -----------------------------------------------------
    #       Note that the command name can be specified via a regex
    #       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
    #       Without the 'sudo' it will only find processes of the current user
    #   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

    #   memHogsTop, memHogsPs:  Find memory hogs
    #   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

    #   cpuHogs:  Find CPU hogs
    #   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

    #   topForever:  Continual 'top' listing (every 10 seconds)
    #   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

    #   ttop:  Recommended 'top' invocation to minimize resources
    #   ------------------------------------------------------------
    #       Taken from this macosxhints article
    #       http://www.macosxhints.com/article.php?story=20060816123853639
    #   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

    #   my_ps: List processes owned by my user:
    #   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

    alias myip='curl https://ipinfo.io/ip'           	# myip:        Public facing IP Address
    alias netCons='lsof -i'                             # netCons:     Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:    Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:       Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:      Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:      Display only open TCP sockets
    alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:     Get info on connections for en0
    alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:     Get info on connections for en1
    alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:   All listening connections
    alias showBlocked='sudo ipfw list'                  # showBlocked: All ipfw rules inc/ blocked IPs

    #   ii:  display useful host related information
    #   -------------------------------------------------------------------
    ii() {
        echo -e "\n${COL_GREEN}You are currently logged in to:$COL_RESET " ; echo -e $HOSTNAME
        echo -e "\n${COL_GREEN}Additional information:$COL_RESET $NC " ; uname -a
        echo -e "\n${COL_GREEN}Users logged on:$COL_RESET $NC " ; w -h
        echo -e "\n${COL_GREEN}Current date:$COL_RESET $NC " ; date
        echo -e "\n${COL_GREEN}Machine stats:$COL_RESET $NC " ; uptime
        echo -e "\n${COL_GREEN}Current network location:$COL_RESET $NC " ; scselect
        echo -e "\n${COL_GREEN}Public facing IP Address:$COL_RESET $NC " ; myip
        #echo -e "\n${COL_GREEN}DNS Configuration :$COL_RESET $NC " ; scutil --dns
        echo
    }

#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

    #   cleanupDS:  Recursively delete .DS_Store files
    #   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

    #   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
    #   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

	#   Local Package Development
    #   -------------------------------------------------------------------
    composer-link() {
        composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
    }

    #   Laravel Framework
    #   -------------------------------------------------------------------
    alias wipe='php artisan clear-compiled;php artisan view:clear;php artisan cache:clear;php artisan config:clear;php artisan route:clear;composer dumpautoload'

    #   PHPUnit
    #   -------------------------------------------------------------------
    alias pu='vendor/bin/phpunit'                           # pu: Run PHPUnit from current directory (Laravel)

#   ---------------------------------------
#   9. Server Security & Cleanup
#   ---------------------------------------

    #   ghost: Run RKHunter/CHKRootKit to verify Ubuntu 16.04 server has not been compromised (https://www.thefanclub.co.za/how-to/how-secure-ubuntu-1604-lts-server-part-1-basics)
    #   -----------------------------------------------------------
    alias ghost='sudo chkrootkit;sudo rkhunter --update;sudo rkhunter --propupd;sudo rkhunter --check;'

    #   cleanup: Package cleanup and removal on Ubuntu server
    #   -----------------------------------------------------------
    alias cleanup='sudo apt clean;sudo apt autoclean -y; sudo apt autoremove -y;'

#   ---------------------------------------
#   10. REMINDERS & NOTES
#   ---------------------------------------

    #   To make a backup from one drive to another:
    #   ---------------------------------------
    #   alias backup='rsync -avrz --delete-after <SOURCE> <DESTINATION>' # Full Backup of <SOURCE> <DESTINATION>
