#! /bin/bash

IS_RUNNING=$(pgrep -x ncmpcpp)

if [ -z "$IS_RUNNING" ]; then
  mpd &
  xterm -geometry 125x30 -title ncmpcpp -e ncmpcpp &
fi
exit