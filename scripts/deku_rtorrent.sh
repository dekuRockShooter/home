#! /bin/bash

IS_RUNNING=$(pgrep -x rtorrent)

if [ -z "$IS_RUNNING" ]; then
  xterm -title rtorrent -e rtorrent &
fi
exit