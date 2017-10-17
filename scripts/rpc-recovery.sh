#!/bin/bash
drpc_pid=`ps ax | grep storm.daemon.drpc | grep -v grep | awk '{print $1}'`
if [ "x$drpc_pid" = "x" ]; then
  echo "Trying to start drpc..."
  /opt/storm/bin/storm drpc &
  for i in $(seq 0 20); do
       if  ps -ef | grep storm.daemon.drpc |grep -v grep > /dev/null; then
          exit 0
      fi
      sleep 1
   done
fi

logviewer_pid=`ps ax | grep storm.daemon.logviewer | grep -v grep | awk '{print $1}'`
if [ "x$logviewer_pid" = "x" ]; then
  echo "Trying to start logviewer..."
  /opt/storm/bin/storm logviewer &
  for i in $(seq 0 20); do
       if  ps -ef | grep storm.daemon.logviewer |grep -v grep > /dev/null; then
          exit 0
      fi
      sleep 1
   done
fi
