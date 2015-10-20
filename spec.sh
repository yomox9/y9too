#!/bin/sh -ux

log=~/spec.log

execlog()
{
	echo $*>>$log 2>&1
	$*>>$log 2>&1
}

rm $log
execlog lshw

execlog uname -a
execlog cat /etc/redhat-release
execlog cat /etc/debian-version
execlog cat /etc/lsb-release
execlog cat /etc/os-release
execlog cat /etc/system-release
execlog cat /etc/system-release-cpe

execlog cat /proc/cpuinfo
execlog lscpu
execlog egrep '(vmx|svm)' /proc/cpuinfo

execlog cat /proc/meminfo

execlog uptime

execlog sysstat

execlog lspci

execlog cat /var/log/dmesg

