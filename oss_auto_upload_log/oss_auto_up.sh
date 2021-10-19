#!/bin/bash
date=$(date -d "yesterday" +%Y-%m-%d)
# filename="/egova/apache-tomcat-7.0.105/logs/catalina.${date}.out"
filename="catalina.${date}.out"
echo ${filename}
# bash oss.sh put ${filename}