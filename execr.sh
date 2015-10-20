#!/bin/sh -u

if [ $# -le 2 ];then
	echo usage : `basename $0` targetname "command(target in each directory=\"target\")"
	echo example. `basename $0` *.bz2 bzip2 -d target
else
	echo '$1'=$1
	target=$1
	shift
	echo '$*'=$*
	execcmd=`echo $* | sed s/target/\{\}/`
	echo execcmd=$execcmd
	echo find . -name $target -execdir $execcmd \;
	find . -name $target -execdir $execcmd \;
fi


