#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

XDG_CONFIG_HOME="$HOME/.config"

# Generated with http://bashrcgenerator.com/.
export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"

alias ls='ls --color=always'

# Colors can be found here:
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
export LS_COLORS=$LS_COLORS:'di=0;97:'

export EDITOR=vim
