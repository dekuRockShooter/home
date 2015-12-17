#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -X --group-directories-first --color=auto'
alias lsl='ls -XhlG --group-directories-first --color=auto'
alias grep='grep -E -i'
alias du_all='du -d1 -h -a'
alias du_sum='du -d0 -h'
PS1='[\u@\h \W]\$ '
PATH="${PATH}:/home/deku/Programs/sublime_text_3/:/home/deku/Programs/firefox/:/home/deku/.config/bspwm/"
CDPATH=".:/home/deku/code/:/home/deku/Programs/qutebrowser-git/src/"
XDG_CONFIG_HOME="$HOME/.config"
export PANEL_FIFO="/tmp/panel-fifo"

function find_reg
{
    COUNT=1
    ARGS=''
    LAST=''
    for ARG in "$@"; do
        if [[ "$COUNT" != 1 && "$COUNT" != "$#" ]];
        then
            ARGS="$ARGS"' '"$ARG"
        else
            LAST="$ARG"
        fi
        COUNT=$(( $COUNT + 1 ))
    done
    find "$1" $ARGS -iregex "$LAST"
}

function find_cur
{
    find_reg . -maxdepth 1 "$1"
}
