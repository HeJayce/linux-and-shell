#!/bin/bash 
start(){
    pid=$(ps -ef | grep frpc |  grep -v "grep" | awk '{print $2}')
    if [ $pid ]; then
        echo "frp 已经在运行,是否重启?"
        echo "1.重启 按任意键退出"
        read frp_restart
        if (($frp_restart==1)); then
            echo frp_restart
            kill -9 $pid
            start
        else
            echo "已退出"
        fi
    else
        echo -n "输入1开启临时,输入2永久开启:"
        read argument 
        if ((${argument}==1)); then
            source oncestart.sh
        elif ((${argument}==2)); then
            source alwaystart.sh
        else 
            echo  "输入错误,自动退出"
        fi
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
echo "请输入你想进行的操作:1启动,2停止"
read status 
if ((${status}==1)); then
    start
elif ((${status}==2)); then
    stop
else 
    echo  "输入错误,自动退出"
fi


