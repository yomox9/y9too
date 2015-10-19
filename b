#!/bin/sh
#background exec shell

nohup $* >> ~/bg.log 2>&1 < /dev/null &
