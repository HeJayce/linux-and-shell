#!/bin/bash
your_name="Jayce"
str="Hello, I know you are \"$your_name\"! \n"
echo -e "${str[@]}"
greeting="hello, "${your_name}" !"
greeting_1="hello, ${your_name} !"
echo $greeting $greeting_1
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo ${your_name:1:4}
echo ${#greeting_2}  $greeting_3
echo ${your_name:0-2:1}


variable=$(ifconfig)
echo $variable


read str1
read str2
#检测字符串是否为空
if [ -z $str1 ] || [ -z $str2 ]
then
    echo "字符串不能为空"
    exit 0
fi
#比较字符串
if [ $str1 = $str2 ]
then
    echo "两个字符串相等"
else
    echo "两个字符串不相等"
fi