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

# Read this document entirely before implementing!

Installing this on a device with low disk space may (and almost certainly will) cause issues such as inability to save other settings if disk is full. I am currently on testing this on devices with 256MB or larger disks.

## How to run this on MT
Run following to your MT device with not less that 7d schedule (sources are not updated more frequently anyway):  

1. Download install.rsc file and upload it to your device
2. In the Mikrotik terminal run: 
```
/import install.rsc
``` 
3. Note: I've had to manually import the blocklist the first time over ssh. I have not come up with a root cause yet, but this does seem to only affect some versions of RouterOS 7 on the RB4011.

You'll also need a firewall rule:  
```
/ip firewall filter add chain=input action=drop connection-state=new src-address-list=pwlgrzs-blacklist in-interface=IFNAME
```  
*Note: Replace IFNAME in-interface name with one you have configured*
