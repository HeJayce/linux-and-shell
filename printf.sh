#!/bin/bash 
#文件名: printf.sh 
printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564
# %-5s指明了一个格式为左对齐且宽度为5的字符串替换（-表示左对齐）
# %-4.2f，其中.2指定保留2个小数位

echo -e "1\t2\t3"
echo -n "1\t2\t3"
echo
echo -e "\e[1;31m This is red text \e[0m" 
echo -e "\e[1;42m Green Background \e[0m"
# printf %s abcdef
# # 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
# printf %s abc def
printf "%s\n" abc def