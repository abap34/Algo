parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function f(arr, k)
    if k > length(arr) - 2
        return 0
    end
    res = BigInt(1)
    return 1 * prod(arr[2:2+k])
end


function main()
MOD = 10^9 + 7
N, K = parseMap(split(readline()))
A = parseMap(split(readline()))

sort!(A)
minases = []
pluses = []

for a in A
    if a < 0
        push!(minases, a)
    else
        push!(pluses, a)
    end
end


max_ans= BigInt(-1) 
for k in 0:2:K
    ans = BigInt(f(minases, k)) + BigInt(f(pluses, K - k))
    if ans > max_ans
        max_ans = ans
    end
end



println(max_ans % MOD)
end

main()
    