#!/bin/bash
i=1
while [ $i -le 5 ] ; do
   echo 'text here'
   let  "i++"
   echo $i
done
