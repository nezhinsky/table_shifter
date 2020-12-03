#!/usr/bin/bash
readarray -t HEADER <$1
#for loop to enumarte the selected colume on $2
arr_pos=0
for col in $HEADER;
do
if [ $col = $2 ]
then
pos1=($arr_pos)
else
((arr_pos++))
fi
done
#echo $pos1
#---------------------------------------------
#itirates through the file and if third conditon is met the #prints the requested line and colum

while IFS=' ' read -r line
do
  arr=($line)
  if [[ ${arr[0]} == $3 ]];
  then
  echo "$2 for $3 is ${arr[$pos1]}"
fi
done < $1
