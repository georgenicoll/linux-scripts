#!/bin/sh
# Drops all firewall rules
echo "Stopping IPv4 firewall and allowing everyone..."
ipt="/usr/sbin/iptables"
## Failsafe - die if /sbin/iptables not found
[ ! -x "$ipt" ] && { echo "$0: \"${ipt}\" command not found."; exit 1; }
$ipt -P INPUT ACCEPT
echo 1
$ipt -P FORWARD ACCEPT
echo 2
$ipt -P OUTPUT ACCEPT
echo 3
$ipt -F
echo 4
$ipt -X
echo 5
$ipt -t nat -F
echo 6
$ipt -t nat -X
echo 7
$ipt -t mangle -F
echo 8
$ipt -t mangle -X
echo 9
$ipt -t raw -F
echo 10
$ipt -t raw -X
echo 11
