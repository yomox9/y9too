#!/bin/sh

cd /home/nmrihserver/serverfiles
while :;do
	echo ======================================================>>nmrih.log
	grep -f p.txt nmrih/console_srv11.log |tail -16>>nmrih.log
	echo `date "+%Y/%m/%d %H:%M:%S"` $0 ./srcds_run -game nmrih +map nmo_broadway -maxplayers 8 -insecure +servercfgfile server_srvXX.cfg +rcon_password $srcds_rcon_pass>>nmrih.log
	df>>nmrih.log
	echo ./srcds_run -game nmrih +map nmo_broadway -maxplayers 8 -insecure +servercfgfile server_srvXX.cfg +rcon_password $srcds_rcon_pass
	./srcds_run -game nmrih +map nmo_broadway -maxplayers 6 -insecure +servercfgfile server_srvXX.cfg +rcon_password $srcds_rcon_pass

done

