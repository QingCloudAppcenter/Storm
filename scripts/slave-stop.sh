#!/bin/bash
 if ! ps -ef | grep storm.daemon.supervisor |grep -v grep > /dev/null; then
         echo "storm  is not running"
         exit 0
     fi
for pid in $(ps ax | grep -i 'storm.daemon'  | grep -v grep | awk '{print $1}')
do
kill -s TERM  $pid
done
 for i in $(seq 0 30); do
     if ! ps -ef | grep storm.daemon.supervisor |grep -v grep > /dev/null; then
         echo "storm slave node is successfully terminated"
         exit 0
     fi
     sleep 1
done
ps -ef|grep storm.daemon|grep -v grep|cut -c 9-15|xargs kill -9
if [ $? -eq 0 ]; then
      echo "storm slave node is successfully killed"
      exit 0
  else
      echo "Failed to kill storm slave node" 
      exit 1
  fi
