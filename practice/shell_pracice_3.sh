#!/bin/bash
cpu() {
    cpuinfo=$(top -n1 -b | grep "%Cpu" | awk '{print $4}' | awk 'BEGIN{FS="."}{print $1}')
    # cpuinfo2=$(echo ${cpuinfo}|awk 'BEGIN{FS="."}{print $1}')
    if [ $cpuinfo -le 50 ]; then
       echo true
  else
       echo false
  fi
}
mem() {
    meminfo=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | awk 'BEGIN{FS="."}{print $1}')
    if [ $meminfo -le 50 ]; then
       echo true
  else
       echo false
  fi
}

# log() {
#     loginfo=$(ls -l /var/log/nginx/error.log | awk '{print $5}')
#    if [ $loginfo -eq 0 ]; then
#        echo true
#   else
#        echo false
#   fi
# }
log() {
  filename="catalina.2021-11-15.out"
  error=$(grep -iw "error" $filename)
  warn=$(grep -iw "warn" $filename)
  if [ -z "${error}" ] && [ -z "${warn}" ]; then
    echo true
  else
    echo false
  fi
}
disk() {
    disk=$(vmstat | grep -v procs | grep -v sy | awk '{print $14}')
    if [ ${disk} -le 50 ]; then
       echo true
  else
       echo false
  fi
}

while true; do
    cpu=$(cpu)
    mem=$(mem)
    log=$(log)
    disk=$(disk)
    echo cpu=${cpu}
    echo mem=${mem}
    echo log=${log}
    echo dick=${disk}
    # log
    if [ $cpu = 'true' ]; then
       echo $(date)+cpu合格 >> /root/shell_pracice_3.log
       else
       echo $(date)+cpu不合格 >> /root/shell_pracice_3.log
  fi
    if [ $mem = 'true' ]; then
       echo $(date)+内存合格 >> /root/shell_pracice_3.log
       else
       echo $(date)+内存不合格 >> /root/shell_pracice_3.log
  fi
      if [ $disk = 'true' ]; then
         echo $(date)+磁盘合格 >> /root/shell_pracice_3.log
         else
       echo $(date)+磁盘不合格 >> /root/shell_pracice_3.log
  fi
      if [ $log = 'true' ]; then
         echo $(date)+日志合格 >> /root/shell_pracice_3.log
         else
       echo $(date)+日志不合格 >> /root/shell_pracice_3.log
  fi
    sleep 10s
done
