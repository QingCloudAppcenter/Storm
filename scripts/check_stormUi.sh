if  ps -ef | grep storm.ui.core |grep -v grep > /dev/null; then
         exit 0
else
    exit 1
fi

