#!/bin/bash
if ! ps -ef | grep storm.daemon |grep -v grep > /dev/null; then
         echo "storm is not running"
         exit 0
     fi
/opt/storm/bin/rpc-stop.sh
if [ $? -eq 0 ]; then
      /opt/storm/bin/storm drpc &
      /opt/storm/bin/storm logviewer &
for i in $(seq 0 180); do
  if  ps -ef | grep storm.daemon.drpc |grep -v grep > /dev/null; then
         echo "storm rpc node  is successfully restarted"
         exit 0
     fi
     sleep 1
done
echo "Fail to restart storm rpc node"
exit 1
  else
      echo "Failed to kill storm rpc node"
      exit 1
  fi
