#!/bin/bash

minute=60

echo -n "enter the number of minutes: "
read answer
clock=minute*answer
start="$(($(date +%s) + $clock))"
while [ "$start" -ge `date +%s` ]; do
    time="$(( $start - `date +%s` ))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
done
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
