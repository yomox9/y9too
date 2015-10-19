#!/bin/sh -eu

log=~/yum_clean.log
du -h /var/cache/yum/ >>$log 2>&1
yum clean all >>$log 2>&1
du -h /var/cache/yum/ >>$log 2>&1
cat $log
