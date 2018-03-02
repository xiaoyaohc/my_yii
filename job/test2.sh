#!/bin/bash
#无需通过公共脚本文件直接执行脚本
#获取当前的时间将其存入变量
dates=`date "+%Y%m"`
#切换到入口文件所在文件夹
cd ../
#php运行php脚本,其中>> /home/wwwlogs/my_yii_cron/test_$1_$dates.log 2>&1为将执行的结果存入日志文件中
php yii test/$1 >> /home/wwwlogs/my_yii_cron/test.$1.$dates.log 2>&1
