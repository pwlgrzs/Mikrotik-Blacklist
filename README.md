# Mikrotik-Blocklist
This is a blocklist I use with on my Mikrotik router to block all connections from known spam/criminal/etc. networks.

Every 7 days I pull lists from Spamhaus and reformat it to allow automatic import to MT routers.

## How to run this on MT
Add following scripts to your MT device with not less that 7d schedule:  
`/tool fetch url="https://raw.githubusercontent.com/pwlgrzs/Mikrotik-Blocklist/master/blacklist.rsc" mode=https;
:log info "Blocklist downloaded";`  

and  

`/ip firewall address-list remove [find where comment="blacklist"]
/import file-name=blacklist.rsc;
:log info "List reinstalled from source";`
