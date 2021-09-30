#!/bin/bash
filename=$(date +%Y-%m-%d)
tail -f -n 200  "/egova/apache-tomcat-7.0.105/logs/catalina.${filename}".out