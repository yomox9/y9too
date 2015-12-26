#!/bin/sh -eu

echo original name=$1
fname=${1##*/}
fname=${fname%.*}
echo fname=$fname

cd ~nmrihserver
ls -laF $1
unzip $1
if [ -e ${fname}.bsp ];then
	mv $fname.bsp $fname.nav $fname.nmo /var/www/html/maps/
else
	mv $fname/$fname.bsp $fname/$fname.nav $fname/$fname.nmo /var/www/html/maps/
fi
cd /var/www/html/maps/
bzip2 $fname.*
bzip2 -d $fname.*
bzip2 $fname.*

echo ---------------
ls -l /var/www/html/maps/${fname}.*
echo ---------------
ls -l ~nmrihserver
echo end.
