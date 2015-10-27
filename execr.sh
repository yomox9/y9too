#!/bin/sh -u

if [ $# -le 2 ];then
	echo usage : `basename $0` targetname "command(target in each directory=\"target\")"
	echo example. `basename $0` *.bz2 bzip2 -d target
else
	echo '$1'=$1
	echo '${@:2}'=${@:2}
	execcmd=`echo ${@:2} | sed s/target/\{\}/`
	echo execcmd=$execcmd
	echo find . -name "$1" -execdir $execcmd \;
	find . -name "$1" -execdir $execcmd \;
fi


