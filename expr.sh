#!/bin/bash
expr 1 + 1
expr 1 - 1
expr 1 / 1
expr 1 \* 1
expr \( 10 + 10 \) \* 2 + 100
expr match "123 456 789" ".*5"
expr substr " this is a test" 3 5
expr index "test for the game" "e"
expr length "this is a test"

# 定义变量
val=$(expr 2 + 2)
echo "2+2=${val}"

#变量计算
a=30
b=20
val_ab=$(expr ${a} + ${b})
echo ${val_ab}