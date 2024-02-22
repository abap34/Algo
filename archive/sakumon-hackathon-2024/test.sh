#!/bin/bash


ok=0
ng=0

echo "naive | solve" > tmp/result.txt
echo "------|------" >> tmp/result.txt

for file in `ls in/*.txt  ` ; do
    echo "Test $file"
    julia solve.jl < $file > tmp.solve.out
    echo "Solve done"
    julia naive.jl < $file > tmp.naive.out
    echo "Naive done"
    diff tmp.solve.out tmp.naive.out
    if [ $? -eq 0 ] ; then
        echo "OK"
        ok=$((ok+1))
    else
        echo "NG"
        ng=$((ng+1))
    fi

    echo "$(cat tmp.naive.out) | $(cat tmp.solve.out)" >> tmp/result.txt
    

done

echo "OK: $ok"
echo "NG: $ng"

rm tmp.solve.out tmp.naive.out
