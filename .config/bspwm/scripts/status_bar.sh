#!/bin/bash

PID=$(pgrep 'dzen_menu\.sh')

echo "$PID"
if [[ -n "$PID" ]]; then
    pkill -f 'dzen'
    pkill -f 'conky.+conkyrc_3'
    exit
fi
cd ~/.config/bspwm/scripts
./dzen_menu.sh &
