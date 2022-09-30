#!/usr/bin/fish

# USAGE
# Cycle trough sinks
# ./script_name.fish left
# ./script_name.fish right

set DEFAULT_SINK_NAME (pactl info | sed -n "s/^Default Sink: \(.*\$\)/\1/p")
set DEFAULT_SINK_ID (pactl list sinks short | sed -n "s/^\([0-9]*\)\s\($DEFAULT_SINK_NAME\).*\$/\1/p")
set SINKS (pactl list sinks short | sed -n "s/^\([0-9]*\)\s.*\$/\1/p")
set SINK_INPUTS (pactl list sink-inputs short | sed -n "s/^\([0-9]*\)\s.*\$/\1/p")

if test $argv[1] = "left"
    set SINKS (echo $SINKS | string split ' ' | sort -r)
else
    set SINKS (echo $SINKS | string split ' ' | sort)
end

function set_default_sink
    set -l sink_id $argv[1]
    set -l sink_name (pactl list sinks | grep -Pzo "Sink #$sink_id(.*\n)*" | sed \$d | sed -n "s/^.*Description: \(.*\).*\$/\1/p" | head -n1)
    pactl set-default-sink $sink_id
	
    for sink_input in $SINK_INPUTS
        pactl move-sink-input $sink_input $sink_id
    end
    test -e /var/tmp/last_sound_sink_notification_id || echo 0 > /var/tmp/last_sound_sink_notification_id
    notify-desktop -R /var/tmp/last_sound_sink_notification_id \
	 "Default has changed to" "$sink_name"
end


set next_will_be_the_default false
for sink in $SINKS
	if $next_will_be_the_default
        set next_will_be_the_default false
        set_default_sink $sink
	end
	
	if test $sink = $DEFAULT_SINK_ID
        set next_will_be_the_default true
	end
end

if $next_will_be_the_default
    set next_will_be_the_default false
    set_default_sink $SINKS[1]
end
