DEBUG = false

function debug(args...)
    if DEBUG
        println(args...)
    end
end


function naive(N, L, R)
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


function solve(N, L, R)
    events = Tuple{Int, Char}[]

    for i in 1:N
        push!(events, (L[i], 'L'))
        push!(events, (R[i], 'R'))
    end

    function compare(x, y)
        if x[1] == y[1]
            return x[2] == 'L' ? -1 : 1
        else
            return x[1] < y[1] ? -1 : 1
        end
    end

    sort!(events, by = x -> (x[1], x[2] == 'L' ? 0 : 1))
    opening = 0
    count = 0

    for event in events
        if event[2] == 'L'
            debug(
                "左端 ($(event[1])) がきた. 開いている数: $(opening)"
            )
            count += opening
            
            debug(
                "現在のカウント: $(count)"
            )

            opening += 1
        else
            opening -= 1
            debug(
                "右端がきた. 閉じる. 開いている数: $(opening)"
            )
            
        end
    end

    return count
end

function main()
    N = parse(Int, readline())
    L = Int[]
    R = Int[]
    for _ in 1:N
        l, r = parse.(Int, split(readline()))
        push!(L, l)
        push!(R, r)
    end

    println(solve(N, L, R))

    if DEBUG
        println("===============")
        @show naive(N, L, R .- 1)
    end
end

main()