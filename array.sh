#!/bin/bash
#定义数组
array_a=(1 2 3 4 5)
echo "${array_a[@]}"
echo "${array_a[3]}"

length=${#array_a[*]}
echo ${length}

echo 


