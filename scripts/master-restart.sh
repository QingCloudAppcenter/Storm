#!/bin/bash
if ! ps -ef | grep storm.daemon |grep -v grep > /dev/null; then
         echo "storm is not running"
         exit 0
     fi
/opt/storm/bin/master-stop.sh
if [ $? -eq 0 ]; then
      /opt/storm/bin/storm nimbus &
      /opt/storm/bin/storm drpc &
      /opt/storm/bin/storm ui &
      /opt/storm/bin/storm logviewer &
 for i in $(seq 0 180); do
      if  ps -ef | grep storm.daemon.nimbus |grep -v grep > /dev/null; then
         echo "storm master node  is successfully restarted"
         exit 0
     fi
     sleep 1
  done
echo "Fail to restart storm master node"
exit 1
  else
      echo "Failed to kill storm master node" 
      exit 1
fi
