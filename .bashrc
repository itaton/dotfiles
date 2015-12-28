#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -al'
alias i3lock='i3lock -c 000000'
PS1='[\u@\h \W]\$ '
