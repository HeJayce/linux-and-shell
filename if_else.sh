#!/bin/bash 
printf "Input a number: "
read a
printf "Input b number: "
read b

if ((${a}==${b}));then 
    echo "a=b"
else 
    echo "a!=b"
fi
    