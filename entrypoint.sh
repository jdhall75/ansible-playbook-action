#!/bin/bash -x


COUNTER=1

for var in "$@"
do
    echo "$COUNTER: $var"
    let COUTER=COUNTER+1
done

time=$(date)
echo "::set-output name=time::$time"