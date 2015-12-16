#!/bin/bash

# Creates a dzen panel that displays the volume.

# Requirements: dzen2, amixer
PIPE='/tmp/volume-fifo'

[ -e "$PIPE" ] && rm "$PIPE"
mkfifo "$PIPE"
./volume_changer.sh 0+
tail -f "$PIPE" | dzen2 -tw $1 -x $2 -ta l -fn $3
wait
