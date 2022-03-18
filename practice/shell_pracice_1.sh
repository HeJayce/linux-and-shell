#!/bin/bash
# filename=toplog_$(date +%Y%m%d%H%M).log

# 这种方法日志输出很奇怪，时间并不按照每分钟记录
# while true ; do
#     top -n 12 -d 5 -b >> toplog_$(date +%Y%m%d%H%M).log
# done

while true; do
    top -n 1 -b >> toplog_$(date +%Y%m%d%H%M).log
    sleep 5s 
done

