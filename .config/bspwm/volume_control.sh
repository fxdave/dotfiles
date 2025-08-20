#!/bin/bash

notify() {
    $HOME/.config/bspwm/notify.sh volume "${@:1}"
}

adjust_volume() {
    local change="$1"
    local description="$2"

    pactl set-sink-volume @DEFAULT_SINK@ "$change"
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n 1)

    notify -u low -h int:value:"$volume"  "Volume" "$description to $volume%"
}

mute_unmute_volume() {
    local state=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    if [ "$state" = "yes" ]; then
        pactl set-sink-mute @DEFAULT_SINK@ 0
        notify -u low "Volume" "Unmuted"
    else
        pactl set-sink-mute @DEFAULT_SINK@ 1
        notify -u low "Volume" "Muted"
    fi
}

case "$1" in
    up)
        adjust_volume "+10%" "Increased"
        ;;
    down)
        adjust_volume "-10%" "Decreased"
        ;;
    up-small)
        adjust_volume "+1%" "Fine-tuned"
        ;;
    down-small)
        adjust_volume "-1%" "Fine-tuned"
        ;;
    mute)
        mute_unmute_volume
        ;;
    *)
        echo "Usage: $0 {up|down|up-small|down-small|mute}"
        exit 1
        ;;
esac
