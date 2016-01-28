#!/bin/sh

if [ "$1" = "/d" ];then
	delflg=1
else
	delflg=0
fi

mapcdir=~/serverfiles/nmrih/
mapcfn=mapcycle.txt
mapc=$mapcdir$mapcfn

mapsdir=~/serverfiles/nmrih/maps/

cnt=0

main(){
for i in `ls ${mapsdir}*.bsp`;do
	fn=`basename $i .bsp`
	echo $fn ====================
	grep -w $fn ${mapc}>nul
	if [ $? = 0 ];then
		echo Exist
	else
		echo not Exist
		for j in bsp nav nmo;do
			if [ -e $mapsdir$fn.$j ];then
				ls $mapsdir$fn.$j
				if [ $delflg = 1 ];then
					rm $mapsdir$fn.$j
				fi
			fi
		done
	fi
	cnt=`expr ${cnt} + 1`
done
}

if [ -e $mapc ];then
	main
	echo Total $cnt files
else
	echo Not exist $mapc
fi

