#!/bin/bash

# Changes the volume and notifies dzen of the change by writing to a fifo.

# Parameters:
#   $1: a valid amixer argument that increases or decreases the volume, or
#       mutes it. This means $1's value can be n+, n-, or toggle (n is an
#       integer).
#
# Returns:
#   Writes a string representing the new volume to the fifo.
#
# Variables:
#   PIPE: the fifo that the volume bar listens to.
#   STATUS: The relevant volume info parsed from amixer's output. This looks
#       like: n% off|on, where n is an integer.
#   MUTE: A string that is empty if the sound is not muted, and not empty
#       if it is.
#   VOL: The volume level as a percentage.
# Requirements: dzen2, amixer

PIPE='/tmp/volume-fifo'

# find the relevant volume info.
STATUS=$(amixer sset Master $1 |\
    grep -o -E -e '[0-9]+%|\<on\>|\<off\>')
if [[ -n "$STATUS" ]];
then
    # If the device is muted, then color it red. Otherwise, leave it as is.
    MUTE=$(echo "$STATUS" | grep -o -E -e 'off')
    VOL=$(echo $STATUS | cut -d" " -f1)
    if [[ -n "$MUTE" ]];
    then
        echo '^fg(red)'"$VOL"'^fg()' > "$PIPE" &
    else
        echo "$VOL" > "$PIPE" &
    fi
fi
