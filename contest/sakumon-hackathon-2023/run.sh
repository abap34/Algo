# ファイルを処理するループ
for input_file in in/*.txt; do
    # ファイル名と拡張子を取得
    filename=$(basename -- "$input_file")
    filename_noext="${filename%.*}"

    echo "Processing $input_file..."
    # Julia スクリプトにファイルを渡して実行し、結果を出力ファイルに保存
    julia solve_O\(N^2\).jl < "$input_file" > "out/${filename_noext}.txt"

    echo "Processed $input_file"
done

echo "All files processed."