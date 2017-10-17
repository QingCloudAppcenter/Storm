#!/bin/bash
ret_val=0

drpc_pid=`ps ax | grep storm.daemon.drpc | grep -v grep | awk '{print $1}'`
if [ "x$drpc_pid" = "x" ]; then
    echo "drpc is not running!"
    ret_val=$[$ret_val + 1]
fi

logviewer_pid=`ps ax | grep storm.daemon.logviewer | grep -v grep | awk '{print $1}'`
if [ "x$logviewer_pid" = "x" ]; then
    echo "logviewer is not running!"
    ret_val=$[$ret_val + 1]
fi

exit $ret_val
