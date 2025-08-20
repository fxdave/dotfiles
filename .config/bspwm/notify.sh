#!/bin/bash
notify_id_path="$HOME/.cache/.notify_id_$1"
notify_id=$(cat "$notify_id_path" 2>/dev/null || echo "0")
new_id="0"

if [[ $notify_id =~ ^[0-9]+$ ]]; then
    new_id=$(notify-send -p -r "$notify_id" "${@:2}")
else
    new_id=$(notify-send -p "${@:2}")
fi

echo "$new_id" > "$notify_id_path"

