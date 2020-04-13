parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    ans = 0
    K = parseInt(readline())
    for a in 1:K
        for b in 1:K
            for c in 1:K
                ans += gcd(a,b,c)
            end
        end
    end
    println(ans)
end

main()