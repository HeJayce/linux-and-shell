#!/bin/bash 
start(){
    echo -n "输入1开启临时，输入2永久开启:"
    read argument 
    if ((${argument}==1)); then
        source oncestart.sh
    elif ((${argument}==2)); then
        source alwaysstart.sh
    else 
        echo  "输入错误,自动退出"
    fi
}
stop (){
    pid=$(ps -ef | grep frpc |  grep -v "grep" | awk '{print $2}')
    if [ $pid ]; then
        kill -9 $pid   
    else
        echo "无进程"
    fi
}
echo "frp启动脚本:"
echo "请输入你想进行的操作：1启动，2停止"
read status 
if ((${status}==1)); then
    start
elif ((${status}==2)); then
    stop
else 
    echo  "输入错误,自动退出"
fi


