# Mikrotik-Blacklist
This is a blocklist I use with on my Mikrotik router to block all connections from known spam/criminal/etc. networks.

Every 7 days I pull lists from:
- Spamhaus (DROP & EDROP)
- dShield  
- blacklist.de (all.txt)

and reformat it to allow automatic import to MT routers.

## How to run this on MT
Run following to your MT device with not less that 7d schedule:  

Download script:  
`/tool fetch url="https://raw.githubusercontent.com/pwlgrzs/Mikrotik-Blacklist/master/blacklist.rsc" mode=https`  
Install script:  
`/ip firewall address-list remove [find where comment="blacklist"]; /import file-name=blacklist.rsc`

You'll also need firewall rule:  
`/ip firewall filter add chain=input action=drop connection-state=new src-address-list=blacklist in-interface=IFNAME`  
*Note: Replace IFNAME in-interface name with one you have configured*

Check out more detailed instructions [here](https://pawelgrzes.pl/blog/mikrotik-blacklist).

You can also import install.rsc file, it will do all of above for you.  
Upload to MT and `run /import file-name=install.rsc` in terminal. You still need to manually add firewall rule.
## TODO
 - Add more sources.
