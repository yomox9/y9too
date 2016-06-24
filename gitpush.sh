#!/bin/sh -eux
echo git pull
git pull
echo git add -A
git add -A
set +e
git status | grep 'nothing to commit, working directory clean' > /dev/null
if [ $? -ne 0 ];then
	comment=`git status|grep -e deleted: -e renamed: -e modified: -e 'new file:'|tr '\n' ','|tr -s '     '|tr -d '#'|tr '\t' ' '`
	echo git commit -m "$comment comment_by_`basename $0`"
	git commit -m "$comment comment_by_`basename $0`"
	echo git push
	git push
fi
set -e
