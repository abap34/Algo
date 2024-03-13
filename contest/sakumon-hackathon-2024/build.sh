#!/bin/bash

echo "generate test cases"
julia generate.jl

echo "run test cases"

echo "" > out/outs.txt
   
echo "| File Name                    |    N     |     K     |      C      |  i  |        ans" >> out/outs.txt
for file in `ls in/*.in  ` ; do
    julia solution.jl < $file > out/tmp.txt
    # ファイル名を 30字左よせ
    printf "%-30s" $file >> out/outs.txt
    # tmp.txtの中身をouts.txtに追加
    cat out/tmp.txt >> out/outs.txt
done
