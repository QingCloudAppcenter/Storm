#!/bin/bash
/opt/storm/bin/storm drpc &
/opt/storm/bin/storm logviewer &
for i in $(seq 0 180); do
     if  ps -ef | grep storm.daemon.drpc |grep -v grep > /dev/null; then
         echo "storm rpc node is successfully started"
         exit 0
     fi
     sleep 1
done
echo "Fail to start storm rpc node"
exit 1
