#!/bin/bash

FLUME_HOME="/opt/module/flume-1.9.0"
case $1 in
   start)
        for host in hadoop102; do
           echo ============================================  $host 启动消费kakfa ============================================
            ssh $host "nohup $FLUME_HOME/bin/flume-ng agent --conf-file $FLUME_HOME/data/kafka-hdfs.conf --name a1 -Dflume.root.logger=INFO,CONSOLE >$FLUME_HOME/logs/kafka_2_hdfs.log 2>&1 &"
        done

   ;;
   stop)
        for host in hadoop102; do
           echo ============================================  $host 停止消费kakfa ============================================
            ssh $host "ps -ef| grep kafka-hdfs.conf | grep -v grep | awk '{print \$2}' | xargs kill -9"
        done
   ;;
   *)
   echo "你输入的姿势不对，请重新输入！"
   echo "  [start] 启动消费kakfa"
   echo "  [stop]  停止消费kakfa"
   ;;
esac