# Mikrotik-Blacklist
This is a blocklist I use with on my Mikrotik router to block all connections from known spam/criminal/etc. networks.

Every couple days I pull lists from:
- Spamhaus (DROP & EDROP)
- dShield  
- blacklist.de (all.txt)
- Feodo
- FireHOL

and reformat it to allow automatic import to MT routers. This is automated process so if you see errors in the final list open an issue please.

# READ THIS BEFORE GOING ANY FORWARD!

As of April 2023 blocklist has almost 5MB, installing this on a device with low disk space, such as HeX PoE, may (and almost certainly will) cause issues such as inability to save other settings if disk is full.  
If you have a device with 16MB disk space I suggest you use a light version of the list, it's also being updated but without heavy pfSense sources.

## How to run this on MT
Run following to your MT device with not less that 7d schedule (sources are not updated more frequently anyway):  

1. Download install.rsc or install-light.rsc file and upload it to your device
2. In the Mikrotik terminal run: `/import install.rsc` or `/import install-light.rsc`
3. Enjoy!

You'll also need firewall rule:  
`/ip firewall filter add chain=input action=drop connection-state=new src-address-list=pwlgrzs-blacklist in-interface=IFNAME`  
*Note: Replace IFNAME in-interface name with one you have configured*

I sometimes add updates and notes about the list [here](https://pawelgrzes.pl/posts/Mikrotik-Blocking-unwanted-connections-with-external-IP-list/).

## Changelog:
 - 17.09.2023
   - pfSense sources removed due to permanent 404
   - added FireHOL source for standard list
 - 15.04.2023
   - Added light version of the list (without heavy pfSense sources) for small disk devices
   - Added light version installer
   - Installers now remove themselves
 - 12.04.2023
   - added pfSense sources (abuse, badguys, block)

### TODO
 - Add more sources.

