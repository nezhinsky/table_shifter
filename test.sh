#!/bin/bash

# test1
./table_shifter.sh ./names/names.txt city London > /tmp/t1.txt && echo Test 1 passed OK
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

./table_shifter.sh ./names/names.txt city ndon > /tmp/t1.txt && echo Test 2 passed OK
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

./table_shifter.sh names/names.txt city > /tmp/t1.txt || echo Test 3 passed OK
if [[ ! $(cat /tmp/t1.txt) =~ "Insufficient" ]]; then
  echo "TEST 3 failed --> ./table_shifter.sh names/names.txt city"
  
fi

# test 4 - column $3 misspeled

./table_shifter.sh ./names/names.txt firstname Bo > /tmp/t1.txt && echo Test 4 passed OK
if [ $(cat /tmp/t1.txt | grep Bo | wc -l) != "1" ]; then
    echo "Test 4 Failed --> /names/names.txt firstname Bo - failed, 'Bo' substring not found"
    exit 1
fi
if [ $(cat /tmp/t1.txt | grep -v Bo | wc -l) != "0" ]; then
    echo "Test 4 Failed --> /names/names.txt firstname Bo - failed, 'Bo' substring not found"
    exit 1
fi
rm /tmp/t1.txt



# test 5 - column $2 misspelled 

./table_shifter.sh names/names.txt ci NY > /tmp/t1.txt || echo Test 5 passed OK
if [ $(cat /tmp/t1.txt | grep NY | wc -l) != "0" ]; then
    echo "Test 5 failed - names/names.txt ci NY - expected ERROR message "
    exit 1
fi

rm /tmp/t1.txt



# test 6 - city not in list

./table_shifter.sh names/names.txt city Aman > /tmp/t1.txt && echo Test 6 passed OK
if [ $(cat /tmp/t1.txt | wc -l) != "0" ]; then
    echo "Tese 6 failed ./table_shifter.sh names/names.txt city Aman "
    exit 1
fi
rm /tmp/t1.txt



# test 7 - substring shared by 2 values
./table_shifter.sh names/names.txt city on > /tmp/t1.txt && echo Test 7 passed OK
if [ $(cat /tmp/t1.txt | grep on | wc -l) != "2" ]; then
    echo "Test 7 failed ./names/names.txt city on --> should present 2 lines"
    exit 1
fi

rm /tmp/t1.txt

# test 8 - checks if names.txt exists
if [ ! -e names/names.txt ] && [ ! -e names/names2.txt ]; 
    then
    echo "Test 8 failed --> text files missing"
    else
    echo Test 8 passed OK
    exit 1
fi

