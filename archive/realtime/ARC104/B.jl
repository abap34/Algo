parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function check(i, j, rA, rT, rG, rC)
    A_count = rA[j] - rA[i]
    T_count = rT[j] - rT[i]
    G_count = rG[j] - rG[i]
    C_count = rC[j] - rC[i]
    if (A_count == T_count) && (G_count == C_count)
        #@show A_count
        #@show T_count
        #@show G_count
        #@show C_count
        return true
    else
        return false
    end
end


function main()
    N, S = split(readline())
    N = parseInt(N)
    #@show N
    #@show S
    rA = [0]
    rT = [0]
    rG = [0]
    rC = [0]

    #=if S[1] == 'A'
        push!(rA, 1)
    else
        push!(rA, 0)
    end

    if S[1] == 'T'
        push!(rT, 1)
    else
        push!(rT, 0)
    end

    if S[1] == 'G'
        push!(rG, 1)
    else
        push!(rG, 0)
    end

    if S[1] == 'C'
        push!(rC, 1)
    else
        push!(rC, 0)
    end=#

    for i in 1:N
        if S[i] == 'A'
            push!(rA, rA[i] + 1)
        else
            push!(rA, rA[i])
        end
    end

    for i in 1:N
        if S[i] == 'T'
            push!(rT, rT[i] + 1)
        else
            push!(rT, rT[i])
        end
    end

    for i in 1:N
        if S[i] == 'G'
            push!(rG, rG[i] + 1)
        else
            push!(rG, rG[i])
        end
    end

    for i in 1:N
        if S[i] == 'C'
            push!(rC, rC[i] + 1)
        else
            push!(rC, rC[i])
        end
    end

    #@show rA
    #@show rT
    #@show rG
    #@show rC
    #println("------")
    ans = 0
    for len in 2:N
        for i in 1:(N - len) + 1
            j = i + len - 1
            s = S[i:j]
            #@show s
            if check(i, j+1, rA, rT, rG, rC) 
                #println("done!")
                #@show i
                #@show j
                ans += 1
            end
            #println("----")
        end
    end

    println(ans)
end

@time main()