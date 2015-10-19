#!/bin/sh -eux
#background exec shell

datetime=`date +%Y%m%d_%H%M%S`
echo "$datetime start $*">>~/bg.log

nohup sh -c "trap 'echo `date +%Y%m%d_%H%M%S` end $*>>~/bg.log;exit 0' 1 2 3 15;$*;echo `date +%Y%m%d_%H%M%S` end $*>>~/bg.log" >> ~/bg.log 2>&1 < /dev/null &
