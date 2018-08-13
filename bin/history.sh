if [ "$@" ]
then
    $( $@ )
    exit 0
fi
# get list of history
tac ~/.zhistory |  awk '{split($0,a,";"); print a[2] }'
