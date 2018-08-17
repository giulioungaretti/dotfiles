#!/bin/bash
if [ "$@" ]
then
    $( $@ ) | xargs -0  notify-send;
    exit 0
fi
# get list of history
tac ~/.zhistory |  awk '{split($0,a,";"); print a[2] }'
