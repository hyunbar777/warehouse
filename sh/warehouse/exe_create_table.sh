#!/bin/bash

# 定义变量
db=gmall
home=/home/duoduo/bin/batch_create_table
hive=/opt/module/hive/bin/hive
tmp=/home/duoduo/bin
if [ -f $tmp/tmp.tmp ]
then
    `rm -rf $tmp/tmp.tmp`
fi
`touch $tmp/tmp.tmp`

function read(){
for file in `ls $1`
do
    if [ -d $1"/"$file ]
    then
          read $1"/"$file
    else

          path=$1"/"$file
          name=$file
        echo "path=$path"
        #echo "name=$name"
        echo "use $db;" >> "$tmp/tmp.tmp"
        echo  `cat $path` >> "$tmp/tmp.tmp"
        echo "msck repair table $name;" >> "$tmp/tmp.tmp"

    fi
done
}
read $home

$hive -e "create database if not exists $db;use $db;"
$hive -f "$tmp/tmp.tmp"