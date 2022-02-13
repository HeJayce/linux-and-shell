#!/bin/bash
# filename=$(date +%Y%m%d)_$(date +%H%M)
# oldname=$(date +%Y%m%d)_$(date +%H%M)
# touch $filename.txt
for file in $(ls); do
    val=1
    echo "${file}"
done
