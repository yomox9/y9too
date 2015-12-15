#!/bin/sh -eu

echo original name=$1
fname=${1##*/}
fname=${fname%.*}
echo fname=$fname

cd ~nmrihserver
ls -laF $1
unzip $1
mv $fname.bsp $fname.nav $fname.nmo /var/www/html/maps/
cd /var/www/html/maps/
bzip2 $fname.*
bzip2 -d $fname.*
bzip2 $fname.*

echo ---------------
ls -laF /var/www/html/maps/${fname}.*
echo ---------------
ls -laF ~nmrihserver
echo end.
