#! /bin/bash

IS_RUNNING=$(pgrep -x iptraf-ng)

if [ -z "$IS_RUNNING" ]; then
  xterm -title iptraf -e sudo /usr/sbin/iptraf-ng -d eth0 -L \
  /home/deku/.iptraf.log &
fi
exit