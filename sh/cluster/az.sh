#!/bin/bash

# 定义变量
az_home=/opt/module/azkaban
case $1 in
    start)
    ssh hadoop100 "sh $az_home/azkaban-executor/bin/azkaban-executor-start.sh"
    ssh hadoop100 "sh $az_home/azkaban-web/bin/azkaban-web-start.sh"
   ;;
   stop)
       ssh hadoop100 "sh $az_home/azkaban-web/bin/azkaban-web-shutdown.sh"
    ssh hadoop100 "sh $az_home/azkaban-executor/bin/azkaban-executor-shutdown.sh"

   ;;
esac


