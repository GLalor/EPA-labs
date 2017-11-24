#!/bin/bash

cnt=`ls /tmp | wc -l`

if [ $cnt -gt 2 ]
then
	echo "Too many files in temp count = $cnt" >> log.txt
fi

