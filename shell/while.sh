#!/bin/bash

COUNTER=0
while [ $COUNTER -lt 5 ]
do
    COUNTER=`expr $COUNTER + 1` #+号之间要用空格
    echo $COUNTER
done



i=1
for ((i=1; i<=100; i++)); do
echo $i
if [ $i -ge 10 ]; then
break
fi
done



i=1
while(($i<10))
do
    if(($i%4==0))
    then
        echo $i
    fi
    i=$(($i+1))
done
