#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

XDG_CONFIG_HOME="$HOME/.config"

# Generated with http://bashrcgenerator.com/.
export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

export LS_COLORS=$LS_COLORS:'di=0;95:'
