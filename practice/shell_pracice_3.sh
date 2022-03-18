#!/bin/bash
#尝试做一个例检的脚本，每分钟调用一次，检查当前总cpu不高于50（可调整），内存不高于50（可调整），每个挂载的磁盘占用不高于80（可调整），系统日志没有error或者warn关键字（可配）。这四个项目中任意一个合格则打印时间，检查内容合格、如果不合格则打印时间检查内容不合格。

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
