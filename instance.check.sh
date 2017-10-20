#!/bin/bash/

cnt=`aws ec2 describe-instance-status --instance-id $1 | grep running | wc -l`

if [ $cnt -gt 0 ];
then
	echo "the instance is running"
else
	echo "no such instance running"
fi

