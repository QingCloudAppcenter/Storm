#!/bin/bash
drpc_pid=`ps ax | grep storm.daemon.drpc | grep -v grep | awk '{print $1}'`
if [ "x$drpc_pid" = "x" ]; then
  echo "Trying to start drpc..."
  /opt/storm/bin/storm drpc &
fi

logviewer_pid=`ps ax | grep storm.daemon.logviewer | grep -v grep | awk '{print $1}'`
if [ "x$logviewer_pid" = "x" ]; then
  echo "Trying to start logviewer..."
  /opt/storm/bin/storm logviewer &
fi
