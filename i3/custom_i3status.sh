#!/bin/sh
# shell script to prepend i3status with more stuff

check_vpn() {
    if [ -d "/proc/sys/net/ipv4/conf/nordlynx" ] || [ -d "/proc/sys/net/ipv4/conf/tun0" ]; then
        echo "yes"
        return 0
    fi

    echo "no"
}

i3status | while :
do
    NOTIFICATION_COUNT=$(rofication-statusi3blocks.py)
    VPN=$(check_vpn)
    
    read line
    echo "Notifications: $NOTIFICATION_COUNT | VPN: $VPN | $line" || exit 1
done
