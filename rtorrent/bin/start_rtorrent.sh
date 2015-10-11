#!/bin/bash

SESSION_DIR=/mnt/data/torrents/.session

/usr/bin/tmux new-session -d -P -s rtorrent -n rtorrent /usr/bin/rtorrent
RETURN=$?
if [ $RETURN -ne 0 ]; then
    >&2 echo "Failed to start tmux session with rtorrent"
    exit $RETURN
fi

# Waiting for rtorrent for 10 seconds to create rtorrent.lock file
COUNTER=10
until [ -f $SESSION_DIR/rtorrent.lock -o $COUNTER -lt 1 ]; do
    let COUNTER-=1
    sleep 1
done
# Exit if file was not created
if [ ! -f $SESSION_DIR/rtorrent.lock ]; then
    >&2 echo "Failed to start rtorrent"
    exit 1
fi
# Create pid file from lock file
cat $SESSION_DIR/rtorrent.lock | awk -F'+' '{print $2}' > $SESSION_DIR/rtorrent.pid

