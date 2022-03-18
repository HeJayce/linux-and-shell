#!/bin/bash
vmstat | pr -t |sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g"|sed "1,2 s/$/ ----time----/g"  > /root/vm.log
while true; do
   sleep 1s
   vmstat | pr -t |sed '1,2d' |sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g" >> /root/vm.log
done



#vmstat | pr -t |sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g"|sed "1,2 s/$/----time----/g" 