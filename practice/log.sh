#!/bin/bash
filename="catalina.2021-11-15.out"
error=$(grep -iw "error" $filename)
warn=$(grep -iw "warn" $filename)
if [ -z "${error}" ] &&  [ -z "${warn}" ]
then
   echo true
else
  echo false
fi
