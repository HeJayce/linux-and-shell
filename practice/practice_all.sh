#!/bin/bash
vmstat_cpuid=50
vm_cpu() {
    vmstat_cpu_now=$(vmstat |grep -v id|grep -v procs|awk '{print $15}')
    if [ $vmstat_cpu_now -le $vmstat_cpuid ]; then
       echo 'cpu不足'
    fi
}
top_pid() {
    
}
while true
do
{
    vm_cpu
    sleep 5s
    
}
done
