parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    ans = 0
    @simd for i in 1:N
        for j in i+1:N
            @inbounds ans += abs(A[i] - A[j])
        end
    end
    println(ans)
end




main()