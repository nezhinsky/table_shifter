#!/bin/bash

echo "Please enter file name:"
echo "---------------------------"
ls -a names/
read filename
echo "you selected : $filename"
path=names/$filename

echo "---------------------------"
echo "    "
echo "city or zip ?"
read city_zip

echo "    "
echo "---------------------------"
echo "Please pick first name:"

#names_list=("name")
while IFS=' ' read -r line
do
  arr=($line)
  if [ ${arr[0]} == "firstname" ];
  then
    echo "------------"
  else
  echo ${arr[0]},${arr[1]}
  fi
done < names/$filename
echo "------------"
read name_selection

./table_shifter.sh $path $city_zip $name_selection
