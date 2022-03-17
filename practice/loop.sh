#!/bin/bash
i=1
while [ $i -le 10 ]; do
    echo "这是第${i}行" >> loop.txt
    let i++
done
cat loop.txt