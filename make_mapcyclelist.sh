#!/bin/sh

rm /home/nmrihserver/serverfiles/nmrih/mapcycle.txt
cd ~/serverfiles/nmrih/maps/
for i in `ls -1 *.bsp`;do
	echo `basename $i .bsp`>>/home/nmrihserver/serverfiles/nmrih/mapcycle.txt
done
cd ~
ln -s /home/nmrihserver/serverfiles/nmrih/mapcycle.txt .

