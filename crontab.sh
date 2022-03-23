#!/bin/bash
setAutoScript(){
    user=$(whoami)
    echo "#* * * * *  /path/script_name (修改路径和频率)" >> /var/spool/cron/$user
    vim /var/spool/cron/$user
}   
echo "crontab 1启动 2停止 3重载 4重启"
echo "crontab 5 设置脚本"
read choose
case "${choose}" in
    1)
        service crond start   #启动服务
    ;;
    2)
        service crond stop    #关闭服务
    ;;
    3)
        service crond reload  #重新载入配置
    ;;
    4)
        service crond restart #重启服务
    ;;
    5)
        setAutoScript
    ;;
esac


