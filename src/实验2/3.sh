#!/bin/bash
cp student1.txt student3.txt
sed -i  's/张三 [0-9]*/张三 95/g'   `grep  -o   "张三 [0-9]*"  -rl  student3.txt`

exec 3<"student1.txt"
exec 4<"student3.txt"
while read line1<&3 && read line2<&4
do
    if [ "$line1" != "$line2" ]
    then
        echo $line1 >> only1.txt
        echo $line2 >> only2.txt
    fi
done 
