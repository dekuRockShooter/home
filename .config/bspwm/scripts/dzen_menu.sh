#!/bin/bash
FONT='-*-MonteCarlo-*-*-*-*-10-*-*-*-*-*-*-*'
TITLE_WIDTH=180
DESKTOPS_MAX=10
DESKTOPS=$(python ./desktops.py $(bspc control --get-status) )
DESKTOPS_SIZE=$(echo $DESKTOPS |  sed s/[^1-9]//g | wc -m)
CONKY_CONFIG='/home/deku/.conkyrc_3'
SLAVE_WIDTH=200
LINES=13

MASTER_VOL=$(amixer get Master |\
    grep -o -E -e '[0-9]+%|\<on\>|\<off\>')
VOL=$(echo $MASTER_VOL | cut -d" " -f1)
if [[ -n "$MASTER_VOL" ]];
then
    # If the device is muted, then color it red. Otherwise, leave it as is.
    MUTE=$(echo "$MASTER_VOL" | grep -o -E -e 'off')
    if [[ -n "$MUTE" ]];
    then
        VOL='^fg(red)'"$VOL"'^fg()'
    fi
fi

(echo -e "$DESKTOPS"'  '"$(date +'%H:%M')"'  '"$VOL";\
    conky -c "$CONKY_CONFIG")\
    | dzen2 -p -fn $FONT -tw $TITLE_WIDTH -w $SLAVE_WIDTH -l $LINES
