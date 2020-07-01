#!/bin/bash

KAFKA_HOME="/opt/module/kafka_2.11-2.4.0"
case $1 in
   start)
   for host in hadoop100 hadoop101 hadoop102 ; do
      echo ============================================  $host 启动Kakfa ============================================
       ssh $host "$KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties "
   done


   ;;
   stop)
     for host in hadoop100 hadoop101 hadoop102 ; do
       echo ============================================  hadoop100 停止Kakfa ============================================
        ssh $host "$KAFKA_HOME/bin/kafka-server-stop.sh stop"
     done
   ;;
   *)
   echo "你输入的姿势不对，请重新输入！"
   echo "  [start] 启动kafka集群"
   echo "  [stop]  停止kafka集群"
   ;;
esac