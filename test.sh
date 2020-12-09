#!/bin/bash
#set -e

# test 1

./table_shifter.sh names/names.txt city London > /tmp/t1.txt
ret=$?
if [[ $ret != 0 ]]; then
    echo "test 1 failed: execution error, retcode: $ret"
elif [[ $(cat /tmp/t1.txt | grep London | wc -l) < 1 ]]; then
    echo "test 1 failed: ./names/names.txt city London - single line expected, none found"
elif [[ $(cat /tmp/t1.txt | grep -v London | wc -l) > 1 ]]; then
    echo "test 1 failed: ./names/names.txt city London - single line expected, extra found"
else
    echo "test 1 passed"
fi
rm /tmp/t1.txt

# test 2

./table_shifter.sh names/names.txt city ndon > /tmp/t1.txt 
if [[ $ret != 0 ]]; then
    echo "test 2 failed: execution error, retcode: $ret"
elif [[ $(cat /tmp/t1.txt | grep ndon | wc -l) < 1 ]]; then
    echo "test 2 failed: ./names/names.txt city ondon - single line expected, none found"
elif [[ $(cat /tmp/t1.txt | grep -v ndon | wc -l) > 1 ]]; then
    echo "test 2 failed: ./names/names.txt city ondon - single line expected, extra found"
else
    echo "test 2 passed"
fi
rm /tmp/t1.txt

# test 3 - check minimum arguments



./table_shifter.sh names/names.txt city > /tmp/t1.txt 
ret=$?
if [[ $ret = 0 ]]; then
    echo "test 3 failed: execution error, retcode: $ret" 
    else
    echo "test 3 passed" 
fi
rm /tmp/t1.txt


# test 4 - column $3 misspeled but contains substing

./table_shifter.sh ./names/names.txt firstname Bo > /tmp/t1.txt 
ret=$?
if [[ $ret != 0 ]]; then
    echo "test 4 failed: execution error, retcode: $ret"
elif [[ $(cat /tmp/t1.txt | grep Boy| wc -l) < 1 ]]; then
    echo "test 4 failed: ./names/names.txt firstname Bo - single line expected, none found"
elif [[ $(cat /tmp/t1.txt | grep -v Boy | wc -l) > 1 ]]; then
    echo "test 4 failed: ./names/names.txt firstname Bo - single line expected, extra found"
else
    echo "test 4 passed"
fi
rm /tmp/t1.txt



# test 5 - column $2 misspelled 

./table_shifter.sh names/names.txt ci NY > /tmp/t1.txt 
ret=$?
if [[ $ret = 0 ]]; then
    echo "test 5 failed: execution error, retcode: $ret"
elif [[ $(cat /tmp/t1.txt | grep NY | wc -l) != "0" ]]; then
    echo "Test 5 failed - names/names.txt ci NY - expected ERROR message "
    exit 1
else
    echo "test 5 passed"
fi
rm /tmp/t1.txt


# test 6 - city not in list

./table_shifter.sh names/names.txt city Aman > /tmp/t1.txt
if [ $(cat /tmp/t1.txt | wc -l) != "0" ]; then
    echo "Tese 6 failed ./table_shifter.sh names/names.txt city Aman "
    exit 1
else
    echo "test 6 passed"
fi
rm /tmp/t1.txt



# test 7 - substring shared by 2 values
./table_shifter.sh names/names.txt city on > /tmp/t1.txt
ret=$?
if [[ $ret != 0 ]]; then
    echo "test 7 failed: execution error, retcode: $ret"
elif [[ $(cat /tmp/t1.txt | grep on | wc -l) < 2 ]]; then
    echo "test 7 failed: ./names/names.txt city London - 2 single line expected, none found"
elif [[ $(cat /tmp/t1.txt | grep -v on | wc -l) > 1 ]]; then
    echo "test 7 failed: ./names/names.txt city London - single line expected, extra found"
else
    echo "test 7 passed"
fi
rm /tmp/t1.txt


# test 8 - checks if names.txt exists
if [ ! -e names/names.txt ] && [ ! -e names/names2.txt ]; 
    then
    echo "Test 8 failed --> text files missing"
    else
    echo "test 8 passed"
    
fi

