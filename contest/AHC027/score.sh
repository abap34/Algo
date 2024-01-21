#!/bin/bash

# 第一引数として julia のパスを受け取る
if [ $# -ne 1 ]; then
    echo "Usage: $0 <julia path>"
    exit 1
fi

julia_path=$1

outputs=()
for path in $(ls ./in2/*.txt); do
    echo "Running $path..."
    cmd="julia $julia_path main.jl < $path"
    output=$(eval $cmd)
    outputs+=("$output")
done

mean=0
for output in "${outputs[@]}"; do
    mean=$(echo "$mean + $output" | bc)
done

mean=$(echo "scale=2; $mean / ${#outputs[@]}" | bc)

echo "================================"
echo "| Result for $julia_path"
echo "==============================="
echo "| mean | $mean                 |"
echo "==============================="
