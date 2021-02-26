#!/usr/bin/bash

function usage () {
echo "NOTE: ./table_shifter <file> <column name> <column val>"
}


if [[ $# < 3 ]]; then 
  echo "Insufficient arguments expected 3 you enterd $# "
  usage
  exit 1
fi

# check if file name enterd correctly 
if [ ! -f $1 ]; then
    echo "invalid file name"
    usage
    exit 1
fi


readarray -n 1 -t HEADER <$1
#for loop to enumerate the selected column on $2
arr_pos=0
for col in $HEADER;
  do
    if [[ "$col" == "$2" ]]
    then
    pos1="$arr_pos"
    break
    else
    ((arr_pos++))
    fi
done
if [ -z $pos1 ];
  then
  echo "ERROR : column name does not exist"
  usage
  exit 1
fi
#echo $pos1
#---------------------------------------------
#iterates through the file and if third conditon is met the #prints the requested line and colum

while IFS=' ' read -r line
do
  arr=($line)
  if [[ ${arr[$pos1]} =~ $3 ]]
  then
  echo "${arr[@]}"
  fi
done < $1
