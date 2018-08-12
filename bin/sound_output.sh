#!/bin/bash
set -euf -o pipefail
SINKS=$( pactl  list short sinks | awk '{print $1 "        " $2 }')
if [ "$@" ]
then
    SEL=$(echo "$@" | awk '{print $1}')
    # set default sink
    pacmd set-default-sink "$SEL"
    # now move all streams to current sink
    pacmd list-sink-inputs | grep index | while read line
    do
    pacmd move-sink-input `echo $line | cut -f2 -d' '` "$SEL"
    done
    exit 0
fi
echo "$SINKS"
