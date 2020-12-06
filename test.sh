#!/bin/bash

# test1
./table_shifter.sh ./names/names.txt city London > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep London | wc -l) != "1" ]; then
    echo "./names/names.txt city London - failed, no London"
    exit 1
fi
if [ $(cat /tmp/t1.txt | grep -v London | wc -l) != "0" ]; then
    echo "./names/names.txt city London - failed, extra lines"
    exit 1
fi
rm /tmp/t1.txt

# test2

./table_shifter.sh ./names/names.txt city ndon > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep London | wc -l) != "1" ]; then
    echo "./names/names.txt city London - failed, no London"
    exit 1
fi
if [ $(cat /tmp/t1.txt | grep -v London | wc -l) != "0" ]; then
    echo "./names/names.txt city London - failed, extra lines"
    exit 1
fi
rm /tmp/t1.txt

# test3 - check minimum arguments

./table_shifter.sh ./names/names.txt city > /tmp/t1.txt
if [[ ! $(cat /tmp/t1.txt) =~ "Insufficien" ]]; then
  echo "args condition not succsesful"

fi

# test 4 

./table_shifter.sh ./names/names.txt firstname Bo > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep Bo | wc -l) != "1" ]; then
    echo "./names/names.txt firstname Bo - failed, no Boy"
    exit 1
fi
if [ $(cat /tmp/t1.txt | grep -v Bo | wc -l) != "0" ]; then
    echo "./names/names.txt firstname Bo - failed, extra lines"
    exit 1
fi
rm /tmp/t1.txt

# test 5

./table_shifter.sh ./names/names.txt ci Boy > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep Boy | wc -l) != "0" ]; then
    echo "./names/names.txt ci Boy - failed, ci can't pass as anything but 'city' "
    exit 1
fi

rm /tmp/t1.txt

# test 6 - city not in list

./table_shifter.sh ./names/names.txt city Tel-Aviv > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep Tel-Aviv | wc -l) != "0" ]; then
    echo "./table_shifter.sh ./names/names.txt city Tel-Aviv - failed, Tel-Aviv is not in the list."
    exit 1
fi


# test 7
./table_shifter.sh ./names/names.txt city on > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | grep on | wc -l) != "2" ]; then
    echo "./names/names.txt city on - failed, should present 2 lines"
    exit 1
fi

rm /tmp/t1.txt