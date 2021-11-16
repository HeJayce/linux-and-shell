#!/bin/sh
tomcatpid () {
    tomcat_id1=$(ps -ef | grep egova/tomcat/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    tomcat_id2=$(ps -ef | grep /egova/apache-tomcat-7.0.64/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
    if [ $tomcat_id1 ]; then
        tomcat_id=${tomcat_id1}
    elif [ $tomcat_id2 ]; then
        tomcat_id=${tomcat_id2}
    else
        tomcat_id=123
    fi
    if [ $tomcat_id ]; then
        return $tomcat_id
    fi
}
tomcatpid
echo $tomcat_id
# tomcat_id1=$(ps -ef | grep egova/tomcat/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
# tomcat_id2=$(ps -ef | grep /egova/apache-tomcat-7.0.64/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
# if [ $tomcat_id1 ]; then
#      tomcat_id=${tomcat_id1}
# elif [ $tomcat_id2 ]; then
#      tomcat_id=${tomcat_id2}
# else
#      tomcat_id=null
# fi
# echo ${tomcat_id1}
# echo ${tomcat_id2}
# kill -9 ${tomcat_id}
# kill -9 ${tomcat_id2}
# new_tomcat_id1=$(ps -ef | grep egova/tomcat/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
# new_tomcat_id2=$(ps -ef | grep /egova/apache-tomcat-7.0.64/conf/logging.properties |  grep -v "grep" | awk '{print $2}')
# if [ ! $new_tomcat_id ]; then
#     echo "success"
#     bash /egova/apache-tomcat-7.0.64/bin/startup.sh
# fi
# echo "killed ${tomcat_id}"
# echo "killed ${tomcat_id2}"
