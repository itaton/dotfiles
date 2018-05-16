# shellcheck shell=bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL="vim"
export LS_COLORS='rs=0:di=38;5;33:ln=38;5;51:mh=00:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=01;05;37;41:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;40:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.m4a=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.oga=38;5;45:*.opus=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'
mkcd() {
    mkdir "$1"
    cd "$1" || return
}
countdown(){ #http://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
    date1=$(($(date +%s) + $1));
    while [ "$date1" -ge "$(date +%s)" ]; do
        echo -ne "$(date -u --date @$((date1 - $(date +%s))) +%H:%M:%S)\\r";
        sleep 0.5
    done
    aplay -q /usr/lib/libreoffice/share/gallery/sounds/theetone.wav #end-sound TODO non portable
}
twitch(){ #https://stackoverflow.com/questions/9332802/how-to-write-a-bash-script-that-takes-optional-input-arguments
    streamlink https://www.twitch.tv/"$1" "${2:-720p}"
}
setcolor(){ #sets color of external monitor that supports DDC
    ddcutil setvcp 16 "$1";
    ddcutil setvcp 18 "$2";
    ddcutil setvcp 1A "$3";
}

ddc(){
    if [ "$1" == '1' ]
    then
        ddcutil loadvcp ~/notes/ddc/DDC_day;
    fi
    if [ "$1" == '2' ]
    then
        ddcutil loadvcp ~/notes/ddc/DDC_morning;
    fi
    if [ "$1" == '3' ]
    then
        ddcutil loadvcp ~/notes/ddc/DDC_night;
    fi
    if [ "$1" == '4' ]
    then
        ddcutil loadvcp ~/notes/ddc/DDC_ultra;
    fi
}

alias ls='ls --color=auto'
alias ll='ls -hal'
alias cd='cd -P' #don't follow symlinks
alias mv='mv -i' #prompt before overwrite
alias lcp='rsync -ah --info=progress2' #large copy - shows progress bar

alias i3lock='i3lock -c 000000' #black background to save energy

alias gc='git commit -m'
alias ga='git add .'
alias gg='git pull'
alias gp='git push'
alias gits='git status'
alias pulldiff='git diff @{1}..' #https://stackoverflow.com/questions/61002/how-can-i-generate-a-git-diff-of-whats-changed-since-the-last-time-i-pulled

alias cal='cal -n6 -m'
alias nuke='shred -uz'
alias sshpi='ssh -t alarm@100.85.133.21 "stty sane; export TERM=linux; exec $SHELL"'

alias sd='pwd > ~/.lastDir' #saveWorkingDir
alias rd='cd $(cat ~/.lastDir)' #restoreWorkingDir

alias mt='cd /run/media/stefan/'

alias ds='du -h --max-depth=1 | sort -h'
alias df='df -h'

alias feh='feh -.' #Automatically fit images to window-size
alias grep='grep --color'

PS1='[\u@\h \W]\$ ' #configuration for terminal prompt

stty -ixon #needed for ctrl-r in terminal, iirc?

man() { #colors for man
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export HISTIGNORE=' *' #do not include commands starting with ' ' in history

#enables vi editing on readline when using bash (https://wiki.archlinux.org/index.php/Readline)
set -o vi 
bind -m vi-insert "\\C-l":clear-screen #https://unix.stackexchange.com/questions/104094/is-there-any-way-to-enable-ctrll-to-clear-screen-when-set-o-vi-is-set
