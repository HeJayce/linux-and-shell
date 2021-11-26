#!/bin/bash 
echo "永久"
cd ~
cd /egova/tools/frp_0.30.0_linux_amd64
nohup ./frpc -c frpc.ini &
sstr=$(echo -e $str)
echo "$sstr"