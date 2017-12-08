#!/bin/bash
echo "CO 	N 	 idle" > results.dat #header of results.dat and clears file
for i in {1..150}
do
	./loadtest $i& #running loadtest in background
	sleep 08 #sleeping for 8 seconds = run time
	#print out to results.dat containing C0 N idle time
	echo "`cat synthetic.dat | wc -l` 	$i 	`mpstat -o JSON | jq '.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'`" >> results.dat
	pkill loadtest #killing loadtest
	rm synthetic.dat
done
