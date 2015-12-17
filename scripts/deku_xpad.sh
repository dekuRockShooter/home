#! /bin/bash

IS_RUNNING=$(pgrep -x xpad)

if [ -z "$IS_RUNNING" ]; then
  xpad -s &
else
  xpad -t &
fi
exit