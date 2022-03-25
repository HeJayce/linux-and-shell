#!/bin/bash
while true 
do {
    docker_images_status_exited=$(docker ps -a|grep Exited|grep -v mysql)
    [ "$docker_images_status_exited" ] && echo $docker_images_status_exited >> docker.txt
    sleep 3600s
}
done

