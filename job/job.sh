#!/bin/bash
#公共脚本文件
#判断是否存在$APP_CONF变量，$APP_CONF用于指定设置环境变量的配置文件
if [ -z "$APP_CONF" ]; then
    echo "请在环境变量中指定_SERVER设置文件路径"
    exit
fi

#判断$APP_CONF变量指定的文件路径是否存在
if [ ! -f $APP_CONF ]; then
    echo "APACHE 环境变量配置文件 $APP_CONF 不存在"
    exit
fi

#打开并读取$APP_CONF变量指定的文件路径，并赋值给str变量
str=""
while read line
do
    if [ "${line:0:1}" == "#" ] || [ "${line:0:1}" == "" ]; then
	continue
    fi
    read -a array <<< $line
    str="${str} ${array[1]}=${array[2]}"
done < $APP_CONF

#当前位置切换到入口文件的路径
cd ../

#eval可以读取一连串的参数，然后按照参数特性来执行。
eval "$str php yii $*"
