#!/bin/bash

send_notification() {
    ico="${$HYDE_CONFIG_HOME}/icons/battery-profile-$1"
    notify-send -a "HyDE Notify" -t 800 -i "${ico}" "Mode: $0"
}


declare -A profiles

profile["power-saver"]="balanced"
profile["balanced"]="performance"
profile["performance"]="power-saver"

current_profile=$(powerprofilesctl get)

next_profile=${profiles["$current_profile"]}

powerprofilesctl set $next_profile && send_notification $next_profile
