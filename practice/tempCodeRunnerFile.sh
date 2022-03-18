disk(){
    disk=$(vmstat|grep -v procs|grep -v sy |awk '{print $14}')
    echo ${disk}
    if [ ${disk} -le 50 ];then
       echo true
    fi
    echo "${disk}"
}