for input_file in in/*.txt; do
    filename=$(basename -- "$input_file")
    filename_noext="${filename%.*}"

    echo "Processing $input_file..."
    # Julia スクリプトにファイルを渡して実行し、結果を出力ファイルに保存
    julia solve_O\(N^2\).jl < "$input_file" > "check_eps/${filename_noext}.txt"
    julia solve_rational.jl < "$input_file" > "check_eps/${filename_noext}_rational.txt"
    julia check_eps.jl "check_eps/${filename_noext}.txt" "check_eps/${filename_noext}_rational.txt"

    echo "Processed $input_file"
done

echo "All files processed."n