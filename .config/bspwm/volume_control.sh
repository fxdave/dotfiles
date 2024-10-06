#!/bin/bash

NOTIFY_ID_FILE="$HOME/.volume_notify_id"

get_notify_id() {
    if [ -f "$NOTIFY_ID_FILE" ]; then
        cat "$NOTIFY_ID_FILE"
    else
        echo "0"
    fi
}

set_notify_id() {
    echo "$1" > "$NOTIFY_ID_FILE"
}

adjust_volume() {
    local change="$1"
    local description="$2"

    pactl set-sink-volume @DEFAULT_SINK@ "$change"
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n 1)
    
    local notify_id=$(get_notify_id)
    if [[ "$notify_id" =~ ^[0-9]+$ ]]; then
        new_id=$(notify-send -p -u low -h int:value:"$volume" -r "$notify_id" "Volume" "$description to $volume%")
    else
        new_id=$(notify-send -p -u low -h int:value:"$volume" "Volume" "$description to $volume%")
    fi
    set_notify_id "$new_id"
}

mute_unmute_volume() {
    local state=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    local notify_id=$(get_notify_id)

    if [ "$state" = "yes" ]; then
        pactl set-sink-mute @DEFAULT_SINK@ 0
        new_id=$(notify-send -p -u low -r "$notify_id" "Volume" "Unmuted")
    else
        pactl set-sink-mute @DEFAULT_SINK@ 1
        new_id=$(notify-send -p -u low -r "$notify_id" "Volume" "Muted")
    fi

    set_notify_id "$new_id"
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
