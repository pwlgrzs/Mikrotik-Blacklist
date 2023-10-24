/system script 
add name="mikrotik-blacklist-dl" source={/tool fetch url="https://raw.githubusercontent.com/ndonathan/Mikrotik-Blacklist/main/mikrotik-blacklist.rsc" mode=https}
add name="mikrotik-blacklist-replace" source {/ip firewall address-list remove [find where list="mikrotik-blacklist"]; /import file-name=mikrotik-blacklist.rsc; /file remove mikrotik-blacklist.rsc}
/system scheduler 
add interval=7d name="dl-mt-blacklist" start-date=Jan/01/2000 start-time=00:05:00 on-event=mikrotik-blacklist-dl
add interval=7d name="ins-mt-blacklist" start-date=Jan/01/2000 start-time=00:10:00 on-event=mikrotik-blacklist-replace
/file remove install.rsc
