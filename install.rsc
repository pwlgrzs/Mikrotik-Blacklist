/system script 
add name="blacklist-dl" source={/tool fetch url="https://raw.githubusercontent.com/pwlgrzs/Mikrotik-Blacklist/master/blacklist.rsc" mode=https}
add name="blacklist-replace" source {/ip firewall address-list remove [find where comment="blacklist"]; /import file-name=blacklist.rsc}
/system scheduler 
add interval=7d name="dl-mt-blacklist" start-date=Jan/01/2000 start-time=00:05:00 on-event=blacklist-dl
add interval=7d name="ins-mt-blacklist" start-date=Jan/01/2000 start-time=00:10:00 on-event=blacklist-replace