parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    ans = 0
    N = parseInt(readline())
    A = parseMap(split(readline()))
    for i in 1:2:N
        if A[i] % 2 == 1
            ans += 1 
        end
    end

    println(ans)
end

main()