#!/bin/bash
while true; do
    jenkins_status=$(ps -ef | grep jenkins | grep -v grep)
    [ ! "$jenkins_status" ] && echo $(date +%Y%m%d%H%M%S)  >> jenkins.log
    systemctl restart jenkins
    echo  $(date +%Y-%m-%-d-%H:%M:%S)  | mailx -s "jenkins 异常" he@jayce.icu 2>> /dev/null
    sleep 10s
done
