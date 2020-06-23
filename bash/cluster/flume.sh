#!/bin/bash

# 定义变量
APP=gmall
hive=/opt/module/hive-1.2.1/bin/hive

# 如果是输入的日期按照取输入日期；如果没输入日期取当前时间的前一天
if [ -n $1 ]; then
    do_date=$1
else
  # shellcheck disable=SC2006
  do_date=`date -d '-1 day' +%F`
fi

echo "======================== 日期 $do_date ========================"



sql="
use gmall;
    
"
$hive -e "$sql"