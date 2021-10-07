#!/bin/bash
wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ "$wifi" == "enabled" ]; then
    rfkill block all &
    notify-send.sh -R /var/tmp/toggle_rfkill_notification_id \
		-u critical \
		"rfkill toggler: rf DISABLED"
else
    rfkill unblock all &
    notify-send.sh -R /var/tmp/toggle_rfkill_notification_id \
		-u critical \
		"rfkill toggler: rf ENABLED"
fi
