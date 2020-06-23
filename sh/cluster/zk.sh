#!/bin/bash

ZK_HOME="/opt/module/zookeeper-3.5.7"
case $1 in
   start)
        for host in hadoop100 hadoop101 hadoop102 ; do
           echo ============================================  $host 启动Zookeeper ============================================
            ssh $host "$ZK_HOME/bin/zkServer.sh start"
        done

   ;;
   stop)
        for host in hadoop100 hadoop101 hadoop102 ; do
           echo ============================================  $host 停止Zookeeper ============================================
            ssh $host "$ZK_HOME/bin/zkServer.sh stop"
        done
   ;;
   *)
   echo "你输入的姿势不对，请重新输入！"
   echo "  [start] 启动Zookeeper集群"
   echo "  [stop]  停止Zookeeper集群"
   ;;
esac