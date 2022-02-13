#!/bin/bash 
date=$(date -d "yesterday" +%Y-%m-%d)
catalinalog_filename="/egova/apache-tomcat-7.0.105/logs/catalina.${date}.out"
localhostlog_filename="/egova/apache-tomcat-7.0.105/logs/localhost.${date}.log"
cp ${catalinalog_filename} /egova/log/tomcat_log/catalina
cp ${localhostlog_filename} /egova/log/tomcat_log/localhost