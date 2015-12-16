#!/bin/bash

# original by ???.
#
# modified by bps
# 
# Requires dzen2 and dmplex.
# Battery widget       requires acpi
# Wireless widget      requires wireless_tools
# Volume widget        requires alsa-utils and inotify-tools
# CPU Frequency widget requires cpupower and bc

# dzen2 options
FG='#aaaaaa'
BG='#1a1a1a'
BAR_WIDTH=$(((1366-400) / 2 + 30))
X=$((1366 - BAR_WIDTH))
FONT='-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*'
PIPE="/tmp/volume_fifo"
PIDFILE="$HOME/.dzen-info.pid"

# icons
ICON_PATH="/home/sim/.icons/xbm8x8"
ICON_WIRELESS="^i(${ICON_PATH}/wifi_01.xbm)"
ICON_AC="^i(${ICON_PATH}/ac.xbm)"
ICON_BATTERY="^i(${ICON_PATH}/bat_full_02.xbm)"
ICON_VOLUME="^i(${ICON_PATH}/spkr_01.xbm)"
ICON_MUTED="^i(${ICON_PATH}/spkr_02.xbm)"
ICON_CPUFREQ="^i(${ICON_PATH}/cpu.xbm)"
ICON_TIME="^i(${ICON_PATH}/clock.xbm)"


# Usage: update_bar position icon text
update_bar () {
   echo $1 "  $3" >"$PIPE"
}

update_time () {
   while true; do
      update_bar $1 "$ICON_TIME" "$(date '+%a %-d %b %Y ^fg(white)%H:%M^fg():%S')"
      sleep 1
   done
}

update_battery() {
   local bat_text
   local bat_icon
   while true; do
      bat_text="$(acpi -b)"
      if acpi -a | grep -q on-line; then
         bat_icon="$ICON_AC"
      else
         bat_icon="$ICON_BATTERY"
      fi

      if echo $bat_text | grep -q remaining || echo $bat_text | grep -q 'until charged'; then
         bat_text="$(echo $bat_text | sed -rn 's/.* ([0-9]+%), ([0-9]{2}:[0-9]{2}).*/\1 (\2)/p')"
      elif echo $bat_text | grep -q unavailable; then
         bat_text="$(echo $bat_text | sed -rn 's/.* ([0-9]+%), .*/\1 (unknown)/p')"
      elif echo $bat_text | grep -q Full; then
         bat_text='100% (Full)'
      else
         bat_text='No battery'
      fi

      update_bar $1 "$bat_icon" "$bat_text"
      sleep 20
   done
}

update_wireless () {
   while true; do
      update_bar $1 "$ICON_WIRELESS" "$(iwconfig wlan0 | awk '/Quality/{print $2}' | cut -d'=' -f2 | awk -F'/' '{printf("%.0f%%", $1/$2*100)}') $(iwconfig wlan0|awk '/ESSID/{print $4}'|sed -e 's/.*"\(..*\)"/\1/')"
      sleep 5
   done
}

update_volume() {
   local vol
   local vol_icon
   while true; do
      vol="$(amixer get Master | grep 'Playback')"
      if echo $vol | grep -q off; then
         vol_icon="$ICON_MUTED"
      else
         vol_icon="$ICON_VOLUME"
      fi
      # clickable areas for muting, increasing, and            decreasing volume
      vol_icon="^ca(1, amixer set Master toggle)^ca(4, amixer set Master 5+ unmute)^ca(5, amixer set Master 5-)$vol_icon"
      vol="$(echo $vol | sed -r 's/.*[0-9] \[([0-9]+)%.*/\1/' | gdbar -h 10 -w 30 -fg '#aaaaaa' -bg '#565656')^ca()^ca()^ca()"

      update_bar $1 "$vol_icon" "$vol"
      inotifywait -t 30 -qq /dev/snd/controlC0
   done
}

update_cpufreq () {
   while true; do
      #update_bar $1 "$ICON_CPUFREQ" "$(printf '%3.2f GHz' $(echo 2k$(cpupower frequency-info -f | tail -n 1) 1000000/p | dc))"
      sleep 2
   done
}

#trap 'kill $(jobs -p)' EXIT
#pgrep "$(basename $0)" | grep -v "$$" | xargs kill
#trap 'kill $(jobs -p)' EXIT
#pkill -F "$PIDFILE"
#echo "$$" > "$PIDFILE"

# create pipe
rm -f "$PIPE" >/dev/null 2>&1
mkfifo "$PIPE" >/dev/null 2>&1
if [ ! -p "$PIPE" ]; then
   echo "Could not create named pipe $PIPE; execution failed." >&failed.2
   exit 1
fi
tail -f "$PIPE"  | dzen2 &
#update_wireless 1 &
#update_battery 2 &
#update_volume 3 &
#update_cpufreq 4 &
#update_time 5 &
# I like to have a space at the end
echo "1023 " >"$PIPE"
#while true; do read x; done
