# ./in/ 以下の入力を main.jl に全部入れて正常終了するかチェック

ok=0
ng=0

for f in `ls ./in/`; do
    echo "Running $f"
    julia main.jl < ./in/$f > /dev/null
    # 正常終了しなかったら終了
    if [ $? -ne 0 ]; then
        echo "Failed to run $f"
        exit 1
    fi
done

