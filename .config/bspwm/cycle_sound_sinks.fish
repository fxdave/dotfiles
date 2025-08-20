#!/bin/bash
# USAGE
# Cycle through sinks
# ./script_name.sh left
# ./script_name.sh right
notify() {
  $HOME/.config/bspwm/notify.sh sink "${@:1}"
}

# File to remember last sink index
STATE_FILE="/tmp/next-sink-index"

# Get all sink names (sorted alphabetically for stable order)
sinks=($(pactl list short sinks | awk '{print $2}' | sort))


# Build an associative array sink_name -> description
declare -A sink_desc
while IFS= read -r line; do
  if [[ $line =~ Name:\ (.+) ]]; then
    current_sink="${BASH_REMATCH[1]}"
  elif [[ $line =~ Description:\ (.+) ]]; then
    sink_desc["$current_sink"]="${BASH_REMATCH[1]}"
  fi
done < <(pactl list sinks)

# Load last index, default to -1 if file doesn't exist
if [[ -f "$STATE_FILE" ]]; then
  last_index=$(<"$STATE_FILE")
else
  last_index=-1
fi

# Determine direction
direction=${1:-right}  # default = right

if [[ "$direction" == "right" ]]; then
  next_index=$(( (last_index + 1) % ${#sinks[@]} ))
elif [[ "$direction" == "left" ]]; then
  next_index=$(( (last_index - 1 + ${#sinks[@]}) % ${#sinks[@]} ))
else
  echo "Usage: $0 [left|right]"
  exit 1
fi


# Set next sink as default
pactl set-default-sink "${sinks[$next_index]}"

# Move existing inputs
for input in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$input" "${sinks[$next_index]}"
done

# Save the index for next time
echo "$next_index" > "$STATE_FILE"


next_sink="${sinks[$next_index]}"
# Get friendly description for next_sink
friendly_name=$(pactl list sinks | awk -v sink="$next_sink" '
  $1=="Name:" {current=$2}
  $1=="Description:" && current==sink {$1=""; print substr($0,2)}')

notify "🔊 ${friendly_name}"
