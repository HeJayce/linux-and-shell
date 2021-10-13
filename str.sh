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
read -r "asd" num 
echo ${num}