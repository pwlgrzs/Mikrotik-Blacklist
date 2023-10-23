/system script 
add name="mikrotik-blacklist-dl" source={/tool fetch url="https://raw.githubusercontent.com/ndonathan/Mikrotik-Blacklist/master/blacklist.rsc" mode=https}
add name="mikrotik-blacklist-replace" source {/ip firewall address-list remove [find where list="mikrotik-blacklist"]; /import file-name=blacklist.rsc; /file remove blacklist.rsc}
/system scheduler 
add interval=7d name="dl-mt-blacklist" start-date=Jan/01/2000 start-time=00:05:00 on-event=mikrotik-blacklist-dl
add interval=7d name="ins-mt-blacklist" start-date=Jan/01/2000 start-time=00:10:00 on-event=mikrotik-blacklist-replace
/file remove install.rsc
