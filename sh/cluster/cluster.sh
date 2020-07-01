#!/bin/bash

case $1 in
start)
    echo ============================================ 【启动集群】 ============================================
    sh /home/duoduo/bin/zk.sh start
    sleep 4s
    sh /home/duoduo/bin/hadoop.sh start
    sleep 15s
    sh /home/duoduo/bin/kafka.sh start
    sleep 5s
    sh /home/duoduo/bin/flume_2_kafka.sh start
    sleep 2s
    sh /home/duoduo/bin/kafka_2_hdfs.sh start
   ;;
stop)
    echo ============================================ 【停止集群】 ============================================
    sh /home/duoduo/bin/kafka_2_hdfs.sh stop
    sleep 2s
    sh /home/duoduo/bin/flume_2_kafka.sh stop
    sleep 2s
    sh /home/duoduo/bin/kafka.sh stop
    sleep 2s
    sh /home/duoduo/bin/hadoop.sh stop
    sleep 2s
    sh /home/duoduo/bin/zk.sh stop
   ;;
esac