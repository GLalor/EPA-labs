#!/bin/bash

mpstat -o JSON 10 1 | jq '.sysstat.hosts[0].machine','.sysstat.hosts[0].statistics[0].timestamp','.sysstat.hosts[0].statistics[0]."cpu-load"[0].idle'
