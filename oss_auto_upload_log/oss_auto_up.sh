#!/bin/bash
date=$(date +%Y-%m-%d)
# filename="/egova/apache-tomcat-7.0.105/logs/catalina.${date}.out"
filename="catalina.${date}.out"
cd /egova/apache-tomcat-7.0.105/logs
#cat ${filename}
pwd
bash /root/shell/oss.sh put ${filename}
