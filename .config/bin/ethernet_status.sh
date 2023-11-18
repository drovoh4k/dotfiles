#!/bin/sh

echo "$(/usr/sbin/ifconfig ens33 | grep "inet " | awk '{print $2}')"
