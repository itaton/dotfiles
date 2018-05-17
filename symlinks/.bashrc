# shellcheck shell=bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.config/commonProfile ]; then
    source ~/.config/commonProfile
fi

PS1='[\u@\h \W]\$ ' #configuration for terminal prompt

stty -ixon #needed for ctrl-r in terminal, iirc?

#enables vi editing on readline when using bash (https://wiki.archlinux.org/index.php/Readline)
set -o vi 
bind -m vi-insert "\\C-l":clear-screen #https://unix.stackexchange.com/questions/104094/is-there-any-way-to-enable-ctrll-to-clear-screen-when-set-o-vi-is-set
