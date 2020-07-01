#!/bin/bash
HADOOP_HOME="/opt/module/hadoop-3.1.3"
case $1 in
   start)
   echo ============================================  hadoop100 启动HDFS ============================================
   ssh hadoop100 "source /etc/profile;$HADOOP_HOME/sbin/start-dfs.sh"
   echo ============================================  hadoop101 启动YARN ============================================
   ssh hadoop101 "source /etc/profile;$HADOOP_HOME/sbin/start-yarn.sh"
   echo ==========================================  hadoop102 启动历史服务器 ==========================================
    ssh hadoop102 "source /etc/profile;$HADOOP_HOME/bin/mapred --daemon start historyserver"
  # ssh hadoop102 "source /etc/profile;$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver"
   ;;
   stop)
        echo ============================================  hadoop100 停止HDFS ============================================
        ssh hadoop100 "source /etc/profile;$HADOOP_HOME/sbin/stop-dfs.sh"
        echo ============================================  hadoop101 停止YARN ============================================
        ssh hadoop101 "source /etc/profile;$HADOOP_HOME/sbin/stop-yarn.sh"
        echo ==========================================  hadoop102 停止历史服务器 ==========================================
       # ssh hadoop102 "source /etc/profile;$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver"
          ssh hadoop102 "source /etc/profile;$HADOOP_HOME/bin/mapred --daemon stop historyserver"
   ;;
   *)
   echo "你输入的姿势不对，请重新输入！"
   echo "  [start] 启动hadoop集群"
   echo "  [stop]  停止hadoop集群"
   ;;
esac