include("D.jl")

DEBUG = true

function runnaive(N, L, R)
    count = 0
    pair = Tuple{Int, Int}[]
    
    for i in 1:N
        for j in i+1:N
            debug(
                "[$(L[i]), $(R[i])] vs. [$(L[j]), $(R[j])]"
            )
            if i == j
                continue
            end

            if (L[i] <= L[j] <= R[i] || L[i] <= R[j] <= R[i]) || (L[j] <= L[i] <= R[j] || L[j] <= R[i] <= R[j])
                debug("match!")
                push!(pair, (i, j))
                count += 1
            else
                debug("not match")
            end
        end
    end

    return count, pair
end

function test()
    N = 2
    L = rand(1:5, N)
    R = L .+ rand(1:5, N)
    ans = solve(N, L, R)
    naive = runnaive(N, L, R .- 1)[1]

    if ans == naive
        println("OK")
        return true
    else
        println("NG")
        println("N = $N")
        println("L = $L")
        println("R = $R")
        println("ans = $ans")
        println("naive = $naive")
        return false
    end
end

for i in 1:100
    if !test()
        break
    end
end