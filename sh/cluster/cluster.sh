#!/bin/bash
home=/home/duoduo/bin
case $1 in
start)
    echo "============================================ 【启动集群】 ============================================"
    sh $home/zk.sh start
    sleep 4s
    sh $home/hadoop.sh start
    sleep 20s
    sh $home/kafka.sh start
    sleep 5s
    sh $home/flume_2_kafka.sh start
    sleep 2s
    sh $home/kafka_2_hdfs.sh start
    sleep 2s
    sh $home/hive.sh start
    #sleep 2s
    #sh /home/duoduo/bin/az.sh start
   ;;
stop)
    echo "============================================ 【停止集群】 ============================================"
    #sh /home/duoduo/bin/az.sh stop
    #sleep 2s
    sh $home/hive.sh stop
    sleep 2s
    sh $home/kafka_2_hdfs.sh stop
    sleep 2s
    sh $home/flume_2_kafka.sh stop
    sleep 2s
    sh $home/kafka.sh stop
    sleep 2s
    sh $home/hadoop.sh stop
    sleep 2s
    sh $home/zk.sh stop
   ;;
esac