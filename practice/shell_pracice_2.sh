#!/bin/bash
# 将vmstat命令的结果输出到一个文件，要求每行都有执行时间

vmstat | pr -t |sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g"|sed "1,2 s/$/ ----time----/g"  > /root/vm.log
while true; do
   sleep 1s
   vmstat | pr -t |sed '1,2d' |sed "$ s/$/  $(date +%Y%m%d%H%M%S)/g" >> /root/vm.log
done



#vmstat | pr -t |sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g"|sed "1,2 s/$/----time----/g" 