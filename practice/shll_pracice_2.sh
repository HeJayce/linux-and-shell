#!/bin/bash
log=$(vmstat 1 5 | column -t)
sed "3,$ s/$/  $(date +%Y%m%d%H%M%S)/g" $log

echo $log