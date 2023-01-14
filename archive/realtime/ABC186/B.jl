parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    H, W = parseMap(split(readline()))
    A = []
    for i in 1:H
        _A = parseMap(split(readline()))
        append!(A, _A)
    end


    m = minimum(A)
    ans = 0
    for a in A
        ans += (a - m)
    end

    println(ans)
end

main()