#!/bin/bash
i=0
sum=0
sum2=0
stu_num=0
min=101
max=-1

while read line
do
    array=(${line/ / })
    for var in ${array[@]}
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
                if ((var < min ))
                then
                    let "min = var"
                fi
                if ((var > max))
                then
                    let "max = var"
                fi
                let "sum = sum + var"
                let "sum2 = sum2 + var*var"
            ;;
        esac
        let "i++"
    done
done < student1.txt
echo "总分数"  $sum
echo -e  "平均分 \c"   
echo "scale=2; $sum / $stu_num" | bc
echo "最高分"   $max
echo "最低分"   $min
echo -e "方差 \c" 
abc=$(echo "scale=2; $sum2/$stu_num -($sum/$stu_num)*($sum/$stu_num)" | bc)
echo $abc
echo -e "标准差 \c" 
echo "scale=2; sqrt($abc)" | bc
