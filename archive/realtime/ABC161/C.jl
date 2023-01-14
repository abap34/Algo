parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N,K = parseMap(split(readline()))
if abs(N - K) > N
    println(N)
else
    if N > K
        h = N ÷ K
        N -= K * h
        ans = min(abs(N-K),N)
        println(ans)
    else
        h = K ÷ N
        K -= N * h
        ans = min(abs(N-K),K)
        println(ans)
    end
end
end

main()