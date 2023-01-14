parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function update(A, B, C)
    _A = B ÷ 2 + C ÷ 2
    _B = A ÷ 2 + C ÷ 2
    _C = A ÷ 2 + B ÷ 2
    return _A, _B, _C
end

function main()
    A, B, C = parseMap(split(readline()))
    if 1 in ([A, B, C] .% 2)
        return 0
    end

    for i in 1:10^5
        A, B, C = update(A, B, C)
        if 1 in ([A, B, C] .% 2)
            return i
        end
    end
    return -1
end



println(main())