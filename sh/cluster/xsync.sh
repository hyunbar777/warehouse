#!/bin/bash
# 1. 判断参数个数
if [ $# -lt 1 ]
then
    echo "您输入的姿势不对，请输入参数"
    exit;
fi

# 2. 遍历集群所有机器
for host in `cat $1` ; do
    echo ========================= $host ==========================


    for file in $@ ; do
        echo $file
        # 4. 判断文件是否存在
        if [ -e $file ]; then
            # 5. 获取父目录
            pidr=$(cd -P $(dirname $file); pwd)
            # 6. 获取当前文件的名称
            fname=$(basename $file)
            ssh $host "mkdir -p $pidr"
            rsync -av $pidr/$fname $host:$pidr
        else
            echo $file does not exists!
        fi
    done
done
