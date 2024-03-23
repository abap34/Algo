function score(swap, C)
    S = 0
    for i in eachindex(swap)
        if swap[i] % 2 == 1
            S += C[i]
        end
    end

    return S
end



function debug(DP, swap, i, C)
    println("現在の同じな箇所: ($(DP[i][2]-1), $(DP[i][2]))")
    println("現在のswap: $(isodd.(swap))")
    println("現在のスコア: $(score(swap, C))")
end


function main()
    N = parse(Int, readline())
    S = collect(readline())
    C = parse.(Int, split(readline()))

    push!(C, 10^10)
    push!(C, 10^10)
    

    DP = [[0, 0] for _ in 1:N]

    swap = zeros(Int, N)

    if S[1] == S[2]
        if C[1] < C[2]
            swap[1] += 1
            DP[2] = [C[1], 2]
        else
            swap[2] += 1
            DP[2] = [C[2], 2]
        end
    else
        DP[2] = [min(C[1], C[2]), 2]
    end


    for i in 2:N-1
        println("$i 文字目まで確定")
        debug(DP, swap, i, C)
        println(" ↓ ")
        println("S[$i] != S[$(i+1)] == $(S[i] != S[i+1])")

        if S[i] != S[i+1]
            println("一致しないので操作不要.")
            DP[i+1] = [DP[i][1], DP[i][2]]
        else
            # ずれる位置2つになってるので、末尾か今ズレてるところのどちらかを操作
            
            println("一致するので末尾か今一致している箇所 ($(DP[i][2]-1), $(DP[i][2])) のどれかを操作")
            
            current = DP[i][2]

            

            if min(C[i], C[i+1]) < min(C[current], C[current-1])
                # 今の位置を揃える.
                if C[i] < C[i+1]
                    swap[i] += 1
                else
                    swap[i+1] += 1
                end

                DP[i+1] = [DP[i][1] + min(C[i], C[i+1]), DP[i][2]]
            else
                # 元の位置を揃えてズレてる位置を更新
                if C[current] < C[current-1]
                    swap[current] += 1
                else
                    swap[current-1] += 1
                end

                DP[i+1] = [DP[i][1] + C[DP[i][2]], i + 1]
            end
        end

        println("$(i+1) 文字目まで確定")
        debug(DP, swap, i+1, C)
        println("=========================")
    end
    
end

main()