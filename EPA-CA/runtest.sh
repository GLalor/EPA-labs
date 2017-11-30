#!/bin/bash
echo "CO	N	idle" > results.dat #header of results.dat and clears file
for i in {1..50}
do
	./loadtest $i& #running loadtest in background
	sleep 10 #sleeping for ten seconds = run time
	#print out to results.dat containing C0 N idle time
	echo "`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].usr'`	$i	`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`" >> results.dat
	pkill loadtest #killing loadtest
done

