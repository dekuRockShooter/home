#!/bin/bash

# Kill any panels before starting this one.
pkill 'dzen.+|desktops\.sh'
if [[ $# == 1 && $1 == 'kill' ]];
then
    exit
fi
DESKTOP_WIDTH=80
CONKY_WIDTH=30
TIME_WIDTH=130
VOLUME_WIDTH=35
CURRENT_X=0
FONT='-*-MonteCarlo-*-*-*-*-10-*-*-*-*-*-*-*'
# arguments are given as width and starting x-position, both in pixels.
./width_proxy.sh 'desktop' $DESKTOP_WIDTH $CURRENT_X $FONT

CURRENT_X=$(($CURRENT_X + $DESKTOP_WIDTH))
./width_proxy.sh 'volume' $VOLUME_WIDTH $CURRENT_X $FONT

CURRENT_X=$(($CURRENT_X + $VOLUME_WIDTH))
./width_proxy.sh 'conky' $CONKY_WIDTH $CURRENT_X $FONT

CURRENT_X=$(($CURRENT_X + $CONKY_WIDTH))
./width_proxy.sh 'time' $TIME_WIDTH $CURRENT_X $FONT

wait
