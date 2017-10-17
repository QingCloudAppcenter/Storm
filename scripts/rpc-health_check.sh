#!/bin/bash
if  ps -ef | grep storm.daemon.drpc |grep -v grep > /dev/null; then
         exit 0
else
    exit 1
fi

