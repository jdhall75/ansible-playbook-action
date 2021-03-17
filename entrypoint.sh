#!/bin/sh -l

sh -c "echo $*"
time=$(date)
echo "::set-output name=time::$time"