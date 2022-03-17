#!/bin/bash
i=1
while [ $i -le 5 ] ; do
   # echo 'text here'
   let  "i++"
   # echo $i
done
while read a; do
  echo $a | awk '{print $1}'
done < str.sh

