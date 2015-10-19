if [ "$*" = "" ];then
	echo usage : `basename $0` process_name
else
	eval `ps -ef|grep "$*" | awk '{ st = "kill"; printf("%s %d\n",st,$2) }'`
	echo "ps -ef|grep $*"
	ps -ef|grep "$*"
fi
