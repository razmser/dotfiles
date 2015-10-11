#!/bin/bash

SESSION_DIR=/mnt/data/torrents/.session

/usr/bin/tmux send-keys -t rtorrent:rtorrent C-q
RETURN=$?
if [ $RETURN -ne 0 ]; then
    >&2 echo "Failed to stop rtorrent tmux session(already stopped?)"
    exit $RETURN
fi

# Waiting for rtorrent for 10 seconds to destroy rtorrent.lock file
COUNTER=10
until [ ! -f $SESSION_DIR/rtorrent.lock -o $COUNTER -lt 1 ]; do
    let COUNTER-=1
    sleep 1
done

# Exit if file was not destroyed
if [ -f $SESSION_DIR/rtorrent.lock ]; then
    >&2 echo "Failed to stop rtorrent"
    exit 1
fi

# Delete rtorrent pid file
rm $SESSION_DIR/rtorrent.pid

