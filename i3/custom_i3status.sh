#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
    NOTIFICATION_COUNT=$(rofication-statusi3blocks.py)
    
    read line
    echo "Notifications: $NOTIFICATION_COUNT | $line" || exit 1
done