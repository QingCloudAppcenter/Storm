#!/bin/bash
ret_val=0
nimbus_pid=`ps ax | grep storm.daemon.nimbus | grep -v grep | awk '{print $1}'`
if [ "x$nimbus_pid" = "x" ]; then
    echo "nimbus is not running!"
    ret_val=$[$ret_val + 1]
fi

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

ui_pid=`ps ax | grep storm.ui.core | grep -v grep | awk '{print $1}'`
if [ "x$ui_pid" = "x" ]; then
    echo "ui is not running!"
    ret_val=$[$ret_val + 1]
fi

exit $ret_val
