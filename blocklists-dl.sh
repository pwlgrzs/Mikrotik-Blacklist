#!/bin/bash
datetime=$(date)

wget https://iplists.firehol.org/files/firehol_level1.netset -O firehol_level1.netset

echo "# Updated: $datetime" > mikrotik-blacklist.rsc
echo "/ip firewall address-list" >> mikrotik-blacklist.rsc

iplist=$(grep -E "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(3[0-2]|[1-2][0-9]|[0-9]))$" firehol_level1.netset)

i=1;
while read n; do 
  echo "add list=mikrotik-blacklist address=$n" >> mikrotik-blacklist.rsc 
  i=$(($i+1)); 
done <<< "$iplist"

rm -f firehol_level1.netset