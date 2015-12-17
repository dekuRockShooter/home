#! /bin/bash


IS_RUNNING=$(pgrep -x mpd)

if [ -n "$IS_RUNNING" ]; then
  mpd --kill
  
  IS_RUNNING=$(pgrep -x mpd)
  if [ -n "$IS_RUNNING" ]; then
    kill -9 $IS_RUNNING
  fi
fi
exit