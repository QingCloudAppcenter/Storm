#!/bin/bash
supervisor_pid=`ps ax | grep storm.daemon.supervisor | grep -v grep | awk '{print $1}'`
if [ "x$supervisor_pid" = "x" ]; then
  echo "Trying to start supervisor..."
  /opt/storm/bin/storm supervisor &
  for i in $(seq 0 30); do
       if  ps -ef | grep storm.daemon.supervisor |grep -v grep > /dev/null; then
        break
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
        break
      fi
      sleep 1
   done
fi
