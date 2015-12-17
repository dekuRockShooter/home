#! /bin/bash

TEMP=$(sensors | grep -i -e 'cpu temp' | awk '{print $3}' \
 | grep -o -e [0-9\.] | tr -d '\012\015')

echo $TEMP
