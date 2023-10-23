# Mikrotik-Blacklist
This project is based on [pwlgrzs/Mikrotik-Blacklist](https://github.com/pwlgrzs/Mikrotik-Blacklist)

My immediate goals:
- Make the code more generic and configurable
- Add the block list generation process into the repo
- Codify the generation of the install scripts

Potential goals for the future:
- Create Terraform module for deployment/management
- Create GUI install/management

This is a blocklist I use with on my Mikrotik router to block all connections from known spam/criminal/etc. networks.

Block list is based on feed:
- FireHOL

# READ THIS BEFORE GOING ANY FORWARD!

As of April 2023 blocklist has almost 5MB, installing this on a device with low disk space, such as HeX PoE, may (and almost certainly will) cause issues such as inability to save other settings if disk is full.  
If you have a device with 16MB disk space I suggest you use a light version of the list, it's also being updated but without heavy sources. I am currently on testing this on devices with 256MB or larger disks.

## How to run this on MT
Run following to your MT device with not less that 7d schedule (sources are not updated more frequently anyway):  

1. Download install.rsc or install-light.rsc file and upload it to your device
2. In the Mikrotik terminal run: `/import install.rsc` or `/import install-light.rsc` 
3. Note: I've had to manually import the blocklist the first time over ssh. I have not come up with a root cause yet, but this does seem to only affect some versions of RouterOS 7 on the RB4011.

You'll also need firewall rule:  
`/ip firewall filter add chain=input action=drop connection-state=new src-address-list=pwlgrzs-blacklist in-interface=IFNAME`  
*Note: Replace IFNAME in-interface name with one you have configured*

I sometimes add updates and notes about the list [here](https://pawelgrzes.pl/posts/Mikrotik-Blocking-unwanted-connections-with-external-IP-list/).

## Changelog:
 - 17.09.2023
   - added danger.rulez.sk bruteforceblocker as source
   - added Tor exit nodes list
 - 17.09.2023
   - pfSense sources removed due to permanent 404
   - added FireHOL abusers source for standard list
 - 15.04.2023
   - Added light version of the list (without heavy pfSense sources) for small disk devices
   - Added light version installer
   - Installers now remove themselves
 - 12.04.2023
   - added pfSense sources (abuse, badguys, block)

### TODO
 - Add more sources.

