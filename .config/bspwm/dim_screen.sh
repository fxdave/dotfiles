#!/bin/bash

# Brightness will be lowered to this value.
min_brightness=0

# Time to sleep (in seconds) between increments when using sysfs. If unset or
# empty, fading is disabled.
fade_step_time=0.01

set_brightness() {
	local brightness_value=$( bc -l <<< "$1/100" )
	echo $brightness_value
	local active_monitors=$(xrandr | grep " connected" | awk '{print $1}')
	for monitor in $active_monitors; do
	    xrandr --output $monitor --brightness $brightness_value
	done
}

fade_brightness() {
    local level
    for level in $(eval echo {100..$1}); do
        set_brightness $level
        sleep $fade_step_time
    done
}

trap 'exit 0' TERM INT
trap "set_brightness 100; kill %%" EXIT
fade_brightness $min_brightness
sleep 2147483647 &
wait
