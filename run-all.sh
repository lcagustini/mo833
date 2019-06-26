#!/bin/bash

mkdir -p csv
for i in 1 2 4 8
do
    for j in 4 8 16 32
    do
        sh run.sh $i $j
    done
done
mv *.csv csv
