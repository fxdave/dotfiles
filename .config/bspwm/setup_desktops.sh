#!/bin/sh


MONITORS=($(xrandr | grep -Po "^[^ ]+ (connected)" | cut -d' ' -f1 | sort -r))

# turn eDP-1 off when the lid is closed
cat /proc/acpi/button/lid/LID0/state | grep closed \
	&& xrandr --output eDP-1 --off


# For one monitor I create 5 desktops
[[ "${#MONITORS[@]}" == 1 ]] && {
	FIRST_MONITOR=${MONITORS[0]}
	bspc monitor "${FIRST_MONITOR}" -d \
		     "${FIRST_MONITOR}1" \
		     "${FIRST_MONITOR}2" \
		     "${FIRST_MONITOR}3" \
		     "${FIRST_MONITOR}4" \
		     "${FIRST_MONITOR}5"
}

# For 2 or more monitors, create one for first and one for second
# TODO: This should check the real size of the monitor, 
#		setup 5 desktops for the biggest 3 for each other.
[[ "${#MONITORS[@]}" != 1 ]] && {
	SECOND_MONITOR=${MONITORS[1]}
	REST_OF_MONITOR=${MONITORS[@]:2}

	bspc monitor "${FIRST_MONITOR}" -d \
		"${FIRST_MONITOR}1"
	bspc monitor "${SECOND_MONITOR}" -d \
		"${SECOND_MONITOR}1" \
		"${SECOND_MONITOR}2" \
		"${SECOND_MONITOR}3" \
		"${SECOND_MONITOR}4" \
		"${SECOND_MONITOR}5"
	for MONITOR in $REST_OF_MONITOR; do
		bspc monitor $MONITOR -d \
			"${MONITOR}1" \
			"${MONITOR}2" \
			"${MONITOR}3"
	done
}
