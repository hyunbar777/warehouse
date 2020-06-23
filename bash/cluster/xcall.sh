#!/bin/bash


if [[ -n $1 ]]; then
cmd=$@
else
cmd=jps
fi

for host in `cat $1` ; do
    echo ========================= $host ==========================
    ssh $host "source /etc/profile; $cmd"
done
