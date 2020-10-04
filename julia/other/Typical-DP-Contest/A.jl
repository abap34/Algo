parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

const N = parseInt(readline())
const P = parseMap(split(readline()))
function debug(dp)
    for i in 1:N
        for j in 1:sum(P) + 1
            print(dp[i, j], " ")
        end
        println()
    end
end


function main()
    


    dp = zeros(Int, (N, sum(P) + 1))

    # dp[i, j] = i番目までで(j - 1)点が達成できるかどうか
    # i番目まででx点が達成可能 -> dp[i, x + 1] = 1にする

    dp[:, 1] .= 1
    dp[1, P[1] + 1] = 1
    # @show P
    seen = Set{Int}()
    for i in 2:N
        
        for j in 1:sum(P) + 1
            if dp[i - 1, j] == 1
                dp[i, j + P[i]] = 1
                dp[i, j] = 1
            end
        end

        # debug(dp)
        # println("-------")
    end

    #println(sum(dp, dims=1))
    println(sum(sum(dp, dims=1) .!= 0))


end

main()