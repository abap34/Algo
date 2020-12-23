parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    T = parseInt(readline())
    for i in 1:T
        N, S, K = parseMap(split(readline()))
        d = S % K
        if (N % K) == 0
            if S == 0
                println(N ÷ K)
            else
                println(-1)
            end
        else
            n_slide = K - (N % K)
            if S % n_slide == 0
                println(n_slide)
            else
                println(lcm(n_slide, S))
            end
        end
    end
end

main()