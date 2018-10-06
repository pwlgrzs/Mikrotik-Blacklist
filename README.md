# Mikrotik-Blacklist
This is a blocklist I use with on my Mikrotik router to block all connections from known spam/criminal/etc. networks.

Every 7 days I pull lists from:
- Spamhaus (DROP & EDROP)
- dShield  

and reformat it to allow automatic import to MT routers.

## How to run this on MT
Run following to your MT device with not less that 7d schedule:  

Download script:  
`/tool fetch url="https://raw.githubusercontent.com/pwlgrzs/Mikrotik-Blacklist/master/blacklist.rsc" mode=https`  
Install script:  
`/ip firewall address-list remove [find where comment="blacklist"]  
/import file-name=blacklist.rsc`

You'll also need firewall rule:  
`/ip firewall filter add chain=input action=drop connection-state=new src-address-list=blacklist in-interface=<REPLACE>`  
*Note: Replace above in-interface name with one you have configured*

Check out more detailed instructions [here](https://pawelgrzes.pl/blog/mikrotik-blacklist).
## TODO
 - Add more sources.
