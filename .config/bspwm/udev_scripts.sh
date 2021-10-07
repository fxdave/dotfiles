#!/bin/bash

send() {
	local urgency=$1
	local header=$2
	local text=$3
	local icon=$4
	notify-send-all -u $urgency -i "$icon" "$header" "$text" && exit 0 || exit 1
}

ACTION=$1

[[ "${ACTION}" = "battery_below_20" ]] && send normal "Battery" "Under 20%" battery
[[ "${ACTION}" = "battery_below_10" ]] && send critical "Battery" "Under 10%" battery
