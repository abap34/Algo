function main()
    X = parse(Int, readline())
    # 切り上げ
    println(ceil(Int, X // 10))
end

main()