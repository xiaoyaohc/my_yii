#!/bin/bash
#通过读取公共脚本文件执行脚本
#设置环境变量
export APP_CONF=/usr/local/apache/conf/vhost/my_yii.env.conf
#获取当前的时间将其存入变量
date=`date "+%Y%m%d"`
#执行脚本文件，其中>> /home/wwwlogs/my_yii_cron/$1.$date.log 2>&1为将执行的结果存入日志文件中
bash ./job.sh test/$1 >> /home/wwwlogs/my_yii_cron/test.$1.$date.log 2>&1
