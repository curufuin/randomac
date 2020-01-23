#!/bin/bash

currentHostname=$(hostname)
hostname=$(/usr/bin/shuf -n 1 ~/bin/hostnames.txt)


/bin/echo $hostname > /etc/hostname && /bin/hostname $hostname && /bin/sed -i "s/${currentHostname}/${hostname}/g" /etc/hosts && /sbin/ifconfig wlan0 down && /usr/bin/macchanger -r wlan0 && /etc/init.d/network-manager restart && /sbin/ifconfig wlan0 up && /bin/systemctl restart networking

/usr/bin/hostnamectl set-hostname $hostname
