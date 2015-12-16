#!/bin/bash
# Crates a dzen bar filled with bspwm's desktop information. The occupied
# desktops (ones that have at least one open window) are displayed, and the
# current one is displayed in red. The fifo is used to update the bar
# when necessary.

PIPE='/tmp/panel-fifo'
[ -e "$PIPE" ] && rm "$PIPE"
mkfifo "$PIPE"

bspc control --subscribe > "$PIPE" &
cat "$PIPE" | ./desktops.sh | dzen2 -tw $1 -x $2 -ta l -fn $3
