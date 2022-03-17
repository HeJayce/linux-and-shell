#!/bin/bash
i=1
until [ $i -eq 10 ]; do
   echo $i
   let i++
   if [ $i -eq 7 ]; then
        echo 'text here'     
   fi
done
