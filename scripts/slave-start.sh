#!/bin/bash
/opt/storm/bin/storm supervisor &
/opt/storm/bin/storm logviewer &
for i in $(seq 0 180); do
     if  ps -ef | grep storm.daemon.supervisor |grep -v grep > /dev/null; then
         echo "storm slave node is successfully started"
         exit 0
     fi
     sleep 1
done
echo "Fail to start storm slave node"
exit 1
