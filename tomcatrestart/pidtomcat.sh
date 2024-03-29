#!/bin/sh
tomcatpid () {
    tomcat_id1=$(ps -ef | grep /egova/apache-tomcat-7.0.105/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
   # tomcat_id1=$(ps -ef | grep /egova/tomcat/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    tomcat_id2=$(ps -ef | grep /egova/apache-tomcat-7.0.108/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    # awk '{print $2}'只保留进程号
    # grep -v "grep" 过滤查询
    if [ $tomcat_id1 ]; then
        tomcat_id=${tomcat_id1}
        id=105
    elif [ $tomcat_id2 ]; then
        tomcat_id=${tomcat_id2}
        id=108
    else
        tomcat_id=
    fi
    echo ${tomcat_id}
    if [ $tomcat_id ]; then
        return $tomcat_id
    else
        echo "tomcat 进程不存在"
    fi
}
tomcatpid
echo $tomcat_id
kill -9 ${tomcat_id}
tomcatpid
if [ ! $tomcat_id ]; then
    echo "kill success"
    if ((${id}==108)); then
        bash /egova/apache-tomcat-7.0.108/bin/startup.sh
        echo "tomcat启动108版本"
    elif ((${id}==105));then
        bash /egova/apache-tomcat-7.0.105/bin/startup.sh
    else
        echo "tomcat 无使用版本"
    fi
else
    echo "kill fail"
fi
echo "killed ${tomcat_id}"