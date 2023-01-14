parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


using DataStructures


function main()
    N, C = parseMap(split(readline()))
    f = FenwickTree{BigInt}(10^9)
    ab = []
    for i in 1:N
        a, b, c = parseMap(split(readline()))
        incdec!(f, a , b + 1, c)
        push!(ab, a)
        push!(ab, b)
    end 
    push!(ab, 0)
    sort!(unique(ab), rev=true)
    ans = 0
    for idx in 1:length(ab) - 1
        @show idx
        println("($(ab[idx + 1]) ~ $(ab[idx])) = $(ab[idx + 1] - ab[idx]) 日")
        println("プライム:", C * (ab[idx + 1] - ab[idx]))
        println("通常:", prefixsum(f, idx))
        ans +=  min(prefixsum(f, idx),  C * (ab[idx + 1] - ab[idx]))
    end

    println(ans)
end

@time main()