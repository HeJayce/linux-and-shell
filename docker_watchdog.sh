#!/bin/bash
while true 
do {
    
    docker_images_status_exited=$(docker ps -a|grep Exited|grep -v mysql)
    #docker_images_status_exited=$(docker ps -a|grep Exited)
    # [ "$docker_images_status_exited" ] && echo $(date +%Y%m%d%H%M%S) $docker_images_status_exited >> docker.txt
    if [ "$docker_images_status_exited" ]; then
         echo  $(date +%Y%m%d%H%M%S) $docker_images_status_exited
    fi
    
    sleep 300s
}
done

