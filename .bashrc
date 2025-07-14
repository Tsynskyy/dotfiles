#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
EDITOR=code
VISUAL=code
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
