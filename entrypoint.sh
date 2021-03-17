#!/bin/sh -l

for var in "$@"
do
    echo "$var"
done

time=$(date)
echo "::set-output name=time::$time"