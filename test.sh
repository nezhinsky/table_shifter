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
