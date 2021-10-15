#!/bin/bash
# begin_time=$(date)    #开始时间，使用``替换
# sleep 3s            #休眠20秒
# finish_time=$(date)  #结束时间，使用$()替换
# echo "Begin time: $begin_time"
# echo "Finish time: $finish_time"

begin_time=$(date +%s)    #开始时间，使用``替换
sleep 3s            #休眠20秒
finish_time=$(date +%s)  #结束时间，使用$()替换
echo "Begin time: $begin_time"
echo "Finish time: $finish_time"
echo $(($finish_time-$begin_time))


alias timestamp='date +%s'
#可代替时间戳
timeNowLocal=`timestamp`
echo "${timeNowLocal}"
