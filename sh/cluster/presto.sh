#!/bin/bash

# 定义变量
APP=gmall
presto_home=/opt/module/presto-server-0.196
yanagishima_home=/opt/module/yanagishima-18.0
case $1 in
start)
    for host in hadoop100 hadoop101 hadoop102; do
        echo ============================================  $host ============================================
        ssh $host "$presto_home/bin/launcher $1"
        sleep 5s
        # 启动prestocli
        #ssh $host "$presto_home/presto-cli-0.196-executable.jar --server hadoop100:8881 --catalog hive --schema default"

    done
    ssh hadoop100 "$presto_home/presto-cli-0.196-executable.jar --server hadoop100:8881 --catalog hive --schema default"

   ;;
yan)
echo "启动yanagishima-18.0"
 ssh hadoop100 "source /etc/profile; nohup $yanagishima_home/bin/yanagishima-start.sh >y.log 2>&1 &"
;;
stop)
    ssh hadoop100 "ps -ef | grep  yanagishima.server.YanagishimaServer |grep -v grep | awk '{print \$2}'|xargs kill -9 "
     ssh hadoop100 "ps -ef | grep presto-cli-0.196-executable.jar |grep -v grep | awk '{print \$2}'|xargs kill -9"
    for host in hadoop100 hadoop101 hadoop102; do
        echo ============================================  $host ============================================

        ssh $host "$presto_home/bin/launcher kill"
    done
   ;;
*)
echo "您操作的姿势不对！"
echo "presto [start]|[stop][yan]"
;;
esac
