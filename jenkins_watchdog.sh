#!/bin/bash
# while true; do
echo $(date +%Y%m%d)  >> /root/logs/jenkins.log
jenkins_status=$(ps -ef | grep jenkins | grep -v grep | grep -v jenkins_watchdog)
if [ ! "$jenkins_status" ]; then
    echo $(date +%Y%m%d%H%M%S)  >> /root/logs/jenkins.log
    systemctl restart jenkins
    echo  $(date +%Y-%m-%-d-%H:%M:%S)  | mailx -s "jenkins 异常" he@jayce.icu 2>> /dev/null
fi
# done
