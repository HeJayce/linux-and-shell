#!/bin/bash
# cpu(){
    cpuinfo=$(top -n1 -b|grep "%Cpu"|awk 'BEGIN{FS=", "}{print $2}')
   echo ${cpuinfo}
   
# }
# cpu()

# while true; do
#     cpu=$()
#     mem=$()
#     disk=$()
#     log=$() 
#     if [ $cpu -le 50 ]; then
#        date
#     elif [ $mem -le 50 ]; then
#         date
#     elif [ $disk -le 8 ]; then
#         date  
#     elif [ $log ];then
#         date
#     fi
#     sleep 60s
    
    
# done

