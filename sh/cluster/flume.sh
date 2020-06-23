#!/bin/bash

FLUME_HOME="/opt/module/flume-1.7.0"
case $1 in
   start)
        for host in hadoop100 hadoop101; do
           echo ============================================  $host 启动日志采集 ============================================
            ssh $host "nohup $FLUME_HOME/bin/flume-ng agent --conf-file /opt/module/flume-1.7.0/data/file-kafka.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >$FLUME_HOME/logs/flume_start.log 2>&1 &"
        done

   ;;
   stop)
        for host in hadoop100 hadoop101; do
           echo ============================================  $host 停止日志采集 ============================================
            ssh $host "ps -ef| grep file-kafka.conf | grep -v grep | awk '{print \$2}' | xargs kill -9"
        done
   ;;
   *)
   echo "你输入的姿势不对，请重新输入！"
   echo "  [start] 启动日志采集"
   echo "  [stop]  停止日志采集"
   ;;
esac