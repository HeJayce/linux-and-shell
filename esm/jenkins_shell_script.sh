#!/bin/bash
\cp -f /root/github_project/shell/docker_watchdog.sh /root/esm/
\cp -f /root/github_project/shell/jenkins_watchdog.sh /root/esm/
bash /root/esm/crontab << EOF
6
EOF