#!/bin/sh

clear
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
existflg=0

echo mapcdir=$mapcdir
echo mapcfn=$mapcfn
echo mapc=$mapc
echo mapsdir=$mapsdir
echo movetgtdir=$movetgtdir

cnt=0

main(){
for i in `ls ${mapsdir}*.*`;do
	fn=`basename $i .ztmp`
	fn=`basename $fn .prt`
	fn=`basename $fn _level_sounds.txt`
	fn=`basename $fn .txt`
	fn=`basename $fn .nmos`
	fn=`basename $fn .bsp`
	fn=`basename $fn .nav`
	fn=`basename $fn .nmo`
	bn=`basename $i`
	#echo === i=$i fn=$fn ===================================
	grep -i -w $fn ${mapc}>nul
	if [ $? = 0 ];then
		if [ $existflg = 0 ];then
			echo
			echo -n Exist === $bn
		else
			echo -n " / $bn"
		fi
		existflg=1
	else
		existflg=0
		echo
		echo
		echo -n "Not Exist === $bn ( $i ) $fn"
		if [ $delflg = 1 ];then
			if [ ! -e $movetgtdir ];then
				mkdir $movetgtdir
			fi
			mv $i $movetgtdir
			if [ ! -e $i ];then
				echo " Deleted"
			else
				echo " Delete failed!"
			fi
		else
			echo
		fi
	fi
	cnt=`expr ${cnt} + 1`
done
}

if [ -e $mapc ];then
	main
	if [ existflg = 0 ];then echo;fi
	echo =======================================================================
	echo Total $cnt files
	if [ $delflg = 0 ];then
		echo If you want delete these files, Do `basename $0` /d
	else
		echo Deleted=$movetgtdir
		ls $movetgtdir
	fi
else
	echo Not exist $mapc
fi

