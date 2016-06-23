#!/bin/sh

if [ "$1" = "/d" ];then
	delflg=1
else
	delflg=0
fi

mapcdir=~/serverfiles/nmrih/
mapcfn=mapcycle.txt
mapc=$mapcdir$mapcfn
mapsdir=~nmrihserver/serverfiles/nmrih/maps/
movetgtdir=~nmrihserver/Deleted/

echo mapcdir=$mapcdir
echo mapcfn=$mapcfn
echo mapc=$mapc
echo mapsdir=$mapsdir
echo movetgtdir=$movetgtdir

cnt=0

main(){
for i in `ls ${mapsdir}*.bsp`;do
	fn=`basename $i .bsp`
	# echo -n $fn ===
	grep -w $fn ${mapc}>nul
	if [ $? = 0 ];then
		echo Exist === $fn
	else
		echo not Exist === $fn
		for j in bsp nav nmo;do
			if [ -e $mapsdir$fn.$j ];then
				ls $mapsdir$fn.$j
				if [ $delflg = 1 ];then
					if [ ! -e $movetgtdir ];then
						mkdir $movetgtdir
					fi
					mv $mapsdir$fn.$j $movetgtdir
					if [ ! -e $mapsdir$fn.$j ];then
						echo Deleted
					else
						echo Delete failed!
					fi
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
	if [ $delflg = 0 ];then
		echo If you want delete these files, Do `basename $0` /d
	fi
else
	echo Not exist $mapc
fi

