#!/bin/bash
exec 3<"student1.txt"
exec 4<"student2.txt"
i=0
higher90=0
below60=0


while read line1<&3 && read line2<&4
do
    array1=(${line1/ / })
    array2=(${line2/ / })
    for var in ${array1[@]}
    do
        let "j =i % 3"
        # if  [ $j == 1 ] 
        # then
        #     echo $var
        # fi
        case $j in 
            0)
                let "stu_num++"
                # echo $var
            ;;
            2)
                if ((array1[i%3] < 60 &&  array2[i%3]<60 ))
                then
                   let "below60++"
                fi
                if ((array1[i%3] > 90 ||  array2[i%3]>90 ))
                then
                   let "higher90++"
                fi
            ;;
        esac
        let "i++"
    done
done
echo "两科都小于60的人数：$below60人"
echo "其中一科大于90的人数：$higher90人" 