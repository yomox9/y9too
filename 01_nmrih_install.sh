id | grep nmrihserver
if [ $? == 0 ];then
	sudo yum install glibc.i686 libstdc++.i686
	cd ~/serverfiles
	ln -s ~nmrihserver/y9tool/s.sh .
	mkdir ~/steamcmd
	cd ~/steamcmd
	wget -nc https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xvzf steamcmd_linux.tar.gz
	ln -s ~nmrihserver/y9tool/nmrih_update.sh .
	cd ~
	ln -s /home/nmrihserver/serverfiles/nmrih/maps/ .
	ln -s /home/nmrihserver/serverfiles/nmrih/ .
	ln -s /home/nmrihserver/serverfiles/nmrih/cfg/server_common.cfg .
	ln -s /home/nmrihserver/serverfiles/nmrih/cfg/server_footer.cfg .
	ln -s /home/nmrihserver/serverfiles/nmrih/cfg/server.cfg .
fi
