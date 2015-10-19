#!/bin/sh -eu
#background exec shell

datetime=`date +%Y%m%d_%H%M%S`
echo "$datetime start $*">>~/nohup.log

nohup sh -c "trap 'echo `date +%Y%m%d_%H%M%S` end $*>>~/nohup.log;exit 0' 1 2 3 15;$*;echo `date +%Y%m%d_%H%M%S` end $*>>~/nohup.log" >> ~/nohup.log 2>&1 < /dev/null &
