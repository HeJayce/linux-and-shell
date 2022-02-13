#!/bin/bash
# date=$(date -d "yesterday" +%Y-%m-%d)
date=$(date +%Y-%m-%d)
# filename="/egova/apache-tomcat-7.0.105/logs/catalina.${date}.out"
filename="catalina.${date}.out"
echo ${filename}
bash /root/shell/oss.sh put ${filename}