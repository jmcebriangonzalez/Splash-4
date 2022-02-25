#!/bin/bash

if [ -z "$1" ]
  then
    echo "Missing number of seeds"
fi

for i in `seq 1 ${1}`
do
    mkdir seed${i}
    cd seed${i}
    rm * 2> /dev/null
    cp ../base/*.rcS .
    find . -type f -print0 | xargs -0 sed -i "/libhooks_chkpoint.so/a\\sleep 0.0$i"
    cd ..
done
