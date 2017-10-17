#!/bin/bash
nimbus_pid=`ps ax | grep storm.daemon.nimbus | grep -v grep | awk '{print $1}'`
if [ "x$nimbus_pid" = "x" ]; then
  echo "Trying to start nimbus..."
  /opt/storm/bin/storm nimbus &
fi

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

ui_pid=`ps ax | grep storm.ui.core | grep -v grep | awk '{print $1}'`
if [ "x$ui_pid" = "x" ]; then
  echo "Trying to start ui..."
  /opt/storm/bin/storm ui &
fi
