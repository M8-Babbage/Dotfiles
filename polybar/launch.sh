#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
	polybar main &
	polybar external &
else
polybar main &
fi