#!/bin/bash

echo "[cpu]" > cg.toml
case $1 in
1) echo "    cpus = \"4\"" >> cg.toml ;;
2) echo "    cpus = \"1,5\"" >> cg.toml ;;
4) echo "    cpus = \"2,6,1,5\"" >> cg.toml ;;
8) echo "    cpus = \"0,4,1,5,2,6,3,7\"" >> cg.toml ;;
esac
echo "    mems = \"0\"" >> cg.toml

echo "[memory]" >> cg.toml
case $2 in
4) echo "    limit = 4294967296" >> cg.toml ;;
8) echo "    limit = 8589934592" >> cg.toml ;;
16) echo "    limit = 17179869184" >> cg.toml ;;
32) echo "    limit = 34359738368" >> cg.toml ;;
esac

echo "[[devices]]" >> cg.toml
echo "    access = \"rwm\"" >> cg.toml
echo "    allow = true" >> cg.toml
echo "    major = 0" >> cg.toml
echo "    minor = 0" >> cg.toml
echo "    type = \"a\"" >> cg.toml
echo "[blockIO]" >> cg.toml
echo "    leafWeight = 10" >> cg.toml
echo "    weight = 10" >> cg.toml
echo "[[hugepageLimits]]" >> cg.toml
echo "    limit = 9223372036854771712" >> cg.toml
echo "    pageSize = \"2MB\"" >> cg.toml
echo "[pids]" >> cg.toml
echo "    limit = 1024" >> cg.toml

sudo singularity exec --apply-cgroups cg.toml base mpiexec --allow-run-as-root -n $1 python 3Dadvect.py > $1-$2 && echo "$(tail -n +92 $1-$2)" > $1-$2
mv $1-$2 $1-$2.csv
