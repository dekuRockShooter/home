#!/bin/bash
# Passes the contents of the fifo to the python script.
while read -r line; do
    python desktops.py $line
done
