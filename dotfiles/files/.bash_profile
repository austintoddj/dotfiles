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
    export PATH=~/.composer/vendor/bin:$PATH
    export PATH=~/Sites/dev-setup/scripts:$PATH

    #   Change Prompt
    #   ------------------------------------------------------------
    source ~/.git-prompt.sh
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '

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
    alias edit='subl'                           # edit:         Opens any file in sublime editor
    alias f='open -a Finder ./'                 # f:            Opens current directory in macOS Finder
    alias c='clear'                             # c:            Clear terminal display
    alias which='type -all'                     # which:        Find executables
    alias path='echo -e ${PATH//:/\\n}'         # path:         Print each PATH entry on a separate line
    alias show_options='shopt'                  # show_options: Display bash options settings
    alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
    alias sudo='sudo '                          # sudo:         Enable aliases to be sudo’ed

    trash () { command mv "$@" ~/.Trash ; }     # trash:    Moves a file to the MacOS trash
    md() { mkdir -p "$@" && cd "$@" ; }         # Make a directory and enter it
    rd() { rm -rf "$@" ; }                      # Remove a directory and its files

    #   afk: Lock the screen (when going AFK)
    #   ------------------------------------------
    alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    #   emptytrash: Empty the Trash on all mounted volumes and the main HDD.
    #               Also, clear Apple’s System Logs to improve shell startup speed.
    #               Finally, clear download history from quarantine.
    #   ------------------------------------------
    # alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

    #   lr: Full Recursive Directory Listing
    #   ------------------------------------------
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

    #   mans:   Search manpage given an argument '1' for term given in argument '2' (case insensitive)
    #           Displays paginated result with colored search terms and two lines surrounding each hit.
    #           Example: mans mplayer codec
    #   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

    #   showa: To remind yourself of an alias (given some part of it)
    #   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

    #   calc:  Simple calculator
    #   ---------------------------------------------------------
    function calc() {
        local result="";
        result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
        #                       └─ default (when `--mathlib` is used) is 20
        #
        if [[ "$result" == *.* ]]; then
            # improve the output for decimal numbers
            printf "$result" |
            sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
                -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
                -e 's/0*$//;s/\.$//';  # remove trailing zeros
        else
            printf "$result";
        fi;
        printf "\n";
    }

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

    zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
    alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

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

    alias qfind="find . -name "                 # qfind:    Quickly search for file
    ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
    ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

    #   spotlight: Search for a file using MacOS Spotlight's metadata
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

    alias myip='curl ipecho.net/plain; echo'           	# myip:         Public facing IP Address
    alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
    alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
    alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
    alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
    alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

    #   ii:  display useful host related informaton
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

    alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

    #   cleanupDS:  Recursively delete .DS_Store files
    #   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

    #   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
    #   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

    #   Git
    #   -------------------------------------------------------------------
    alias gits='git status'                                 # gits:             Check the status of a Git initialized repository
    alias gpa='git push origin master && git push origin develop && git push --tags'

    #   Laravel Framework
    #   -------------------------------------------------------------------
    alias wipe='php artisan clear-compiled;php artisan view:clear;php artisan cache:clear;php artisan config:clear;php artisan route:clear;composer dumpautoload'
    alias clearLog='> ./storage/logs/laravel.log'           # clearLog:         Clear the log (Laravel)
    alias viewLog='cat ./storage/logs/laravel.log'          # viewLog:          View the log (Laravel)

    #   Gulp
    #   -------------------------------------------------------------------
    alias gp='gulp --production'                            # gp:               Run Gulp --production (Laravel)

    #   PHPUnit
    #   -------------------------------------------------------------------
    alias pu='vendor/bin/phpunit'                           # pu:               Run PHPUnit from current directory (Laravel)

    #   Apache Web Server
    #   -------------------------------------------------------------------
    alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
    alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
    alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:       Shows apache error logs
    alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs

    #   Miscellaneous
    #   -------------------------------------------------------------------
    httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page
    alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
    alias record='asciinema rec'                            # record:           Record a Terminal Session with Asciinema

    #   httpDebug:  Download a web page and show info on what took time
    #   -------------------------------------------------------------------
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

#   ---------------------------------------
#   9. Server Security & Cleanup
#   ---------------------------------------

    #   ghost: Run RKHunter/CHKRootKit to verify Ubuntu 16.04 server has not been compromised (https://www.thefanclub.co.za/how-to/how-secure-ubuntu-1604-lts-server-part-1-basics)
    #   -----------------------------------------------------------
    alias ghost='sudo chkrootkit;sudo rkhunter --update;sudo rkhunter --propupd;sudo rkhunter --check;'

    #   cleanup: Package cleanup and removal on Ubuntu server
    #   -----------------------------------------------------------
    alias cleanup='sudo apt-get clean;sudo apt-get autoclean -y; sudo apt-get autoremove -y;'

#   ---------------------------------------
#   10. REMINDERS & NOTES
#   ---------------------------------------

    #   remove_disk: Spin down unneeded disk
    #   ---------------------------------------
    #   diskutil eject /dev/disk1s3

    #   To change the password on an encrypted disk image:
    #   ---------------------------------------
    #   hdiutil chpass /path/to/the/diskimage

    #   To make a backup from one drive to another:
    #   ---------------------------------------
    #   alias backup='rsync -avrz --delete-after <SOURCE> <DESTINATION>' # Full Backup of <SOURCE> <DESTINATION>
