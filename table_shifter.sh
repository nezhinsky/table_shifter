#!/usr/bin/bash
readarray -t HEADER <$1
#for loop to enumarte the selected colume on $2
arr_pos=0
for col in $HEADER;
do
if [ $col = $2 ]
then
pos1="$arr_pos"
break
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
  if [[ ${arr[$pos1]} == $3 ]];
  then
  echo "${arr[@]}"
  fi
done < $1
