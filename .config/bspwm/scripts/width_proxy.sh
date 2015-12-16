#!/bin/bash
if [[ $# != 4 ]];
then
    exit
fi

if [[ $1 == 'desktop' ]];
then
    pkill dzen_panel.sh
    ./dzen_panel.sh $2 $3 $4 &
elif [[ $1 == 'volume' ]];
then
    pkill dzen_volume.sh
    ./dzen_volume.sh $2 $3 $4 &
elif [[ $1 == 'conky' ]];
then
    pkill dzen_conky.sh
    ./dzen_conky.sh $2 $3 $4 &
elif [[ $1 == 'time' ]];
then
    pkill dzen_time.sh
    ./dzen_time.sh $2 $3 $4 &
fi
