mkdir testcase
for i in `seq 1 30`
do
mkdir testcase/case$i
/Applications/Julia-1.8.app/Contents/Resources/julia/bin/julia random_test.jl testcase/case$i/input.txt 
./a.out < testcase/case$i/input.txt  > testcase/case$i/cpp_out.txt
/Applications/Julia-1.8.app/Contents/Resources/julia/bin/julia F_submit.jl < testcase/case$i/input.txt > testcase/case$i/julia_out.txt
diff -c testcase/case$i/cpp_out.txt testcase/case$i/julia_out.txt > testcase/case$i/diff.txt
done