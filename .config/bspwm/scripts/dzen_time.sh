#!/bin/bash

# Creates a dzen panel that shows the time. When hovered, it shows a calendar.

# Requirements:
# dzen2
(while true; do \
    date '+%R %a %b %d %Y';\
    cal | sed "s/\($(date +'%_d')\)/^fg(red)\1^fg()/";\
    sleep 10;\
done)\
| dzen2 -fn $3 -tw $1 -x $2 -ta l -l 8 -w 130 -u
