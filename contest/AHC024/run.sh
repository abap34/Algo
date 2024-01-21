# in 以下の txt を全て読んで、 julia main.jl < input.txt > output.txt を実行する
for file in `ls in/*.txt`; do
    echo $file
    julia main.jl < $file > out/`basename $file`
done

