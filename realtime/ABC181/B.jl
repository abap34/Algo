parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    ans = 0
    for i in 1:N
        A, B = parseMap(split(readline()))
        ans += sum(A:B)
    end

    println(ans)
end



main()