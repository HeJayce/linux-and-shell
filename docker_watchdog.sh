#!/bin/bash
while true; do
   {
    status=docker ps -a | grep Exited | grep -v mysql | awk '{print $7}'
    docker_images_status_exited=$(docker ps -a | grep Exited | grep -v mysql | awk '{print $NF}')
    #docker_images_status_exited=$(docker ps -a|grep Exited|awk '{print $NF}')
    # [ "$docker_images_status_exited" ] && echo $(date +%Y%m%d%H%M%S) $docker_images_status_exited >> docker.txt
    if [ "$docker_images_status_exited" ]; then
         echo  $(date +%Y-%m-%-d-%H:%M:%S) $docker_images_status_exited $status >> docker.log
         echo  $(date +%Y-%m-%-d-%H:%M:%S) $docker_images_status_exited $status | mailx -s "docker 异常" he@jayce.icu 2>> /dev/null
    fi
    sleep 300s
  }
done
