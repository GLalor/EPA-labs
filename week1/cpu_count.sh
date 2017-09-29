#!/bin/bash

echo "num processors"

cnt=`grep processor /proc/cpuinfo |wc -l`

if [[ $cnt -le 2 ]]; then
	echo "Too Few CPUs, exiting"
fi
