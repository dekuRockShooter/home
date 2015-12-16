#!/bin/bash

# A dzen panel that displays data sent by conky.
CONKY_CONFIG='~/.conkyrc_3'
WIDTH=200
LINES=13
FONT='-*-MonteCarlo-*-*-*-*-10-*-*-*-*-*-*-*'

(echo 'sys' ; conky -c $CONFIG) \
    | dzen2 -fn "$FONT" -l $LINES -tw $WIDTH -w $WIDTH -p
