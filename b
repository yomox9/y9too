#!/bin/sh -eux
#background exec shell

nohup $* >> ~/bg.log 2>&1 < /dev/null &
