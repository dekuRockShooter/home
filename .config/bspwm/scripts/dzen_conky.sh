#!/bin/bash

# Creates a panel that, when hovered, displays system stats using conky.

# Requirements:
# conky
# dzen2
(echo 'sys'; conky -c ~/.conkyrc) | dzen2 -fn $3 -l 5 -ta l -tw $1 -x $2 -w 200
