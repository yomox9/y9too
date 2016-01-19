#!/bin/sh
cd /home/nmrihserver/steamcmd

./steamcmd.sh +login anonymous +force_install_dir "/home/nmrihserver/serverfiles" +app_update 317670 validate +quit
