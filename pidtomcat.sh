#!/bin/sh
tomcatpid () {
    tomcat_id1=$(ps -ef | grep /egova/apache-tomcat-7.0.105/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    tomcat_id2=$(ps -ef | grep /egova/apache-tomcat-7.0.64/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    if [ $tomcat_id1 ]; then
        tomcat_id=${tomcat_id1}
        id=105
    elif [ $tomcat_id2 ]; then
        tomcat_id=${tomcat_id2}
        id=64
    else
        tomcat_id=
    fi
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
    echo "success"
    if ((${id}==64)); then
        bash /egova/apache-tomcat-7.0.64/bin/startup.sh
    else
        bash /egova/apache-tomcat-7.0.105/bin/startup.sh
    fi
    
    bash /egova/apache-tomcat-7.0.64/bin/startup.sh
fi
echo "killed ${tomcat_id}"

