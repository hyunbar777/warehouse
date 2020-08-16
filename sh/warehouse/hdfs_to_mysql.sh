#!/bin/bash

# 定义变量
APP=gmall
hive=/opt/module/hive/bin/hive

hive_db_name=gmall
mysql_db_name=gmall_report

export_data() {
/opt/module/sqoop-1.4.6/bin/sqoop export \
--connect "jdbc:mysql://hadoop100:3306/${mysql_db_name}?useUnicode=true&characterEncoding=utf-8"  \
--username root \
--password 123456 \
--table $1 \
--num-mappers 1 \
--export-dir /warehouse/$hive_db_name/ads/$1 \
--input-fields-terminated-by "\t" \
--update-mode allowinsert \
--update-key $2 \
--input-null-string '\\N'    \
--input-null-non-string '\\N'
}

case $1 in
  "ads_uv_count")
     export_data "ads_uv_count" "dt"
;;
  "ads_user_action_convert_day")
     export_data "ads_user_action_convert_day" "dt"
;;
  "ads_user_topic")
     export_data "ads_user_topic" "dt"
;;
   "all")
     export_data "ads_uv_count" "dt"
     export_data "ads_user_action_convert_day" "dt"
     export_data "ads_user_topic" "dt"
;;
esac