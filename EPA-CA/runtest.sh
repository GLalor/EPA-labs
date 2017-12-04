#!/bin/bash
echo "CO	N	idle" > results.dat
for i in {1..50}
do
	./loadtest $i& #running loadtest in background
	sleep 10 #sleeping for ten seconds = run time
	echo "`grep 'UserID \[1\]' synthetic.dat | wc -l`	$i	`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`" >> results.dat
	pkill loadtest #killing loadtest
done

