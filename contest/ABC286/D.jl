table = Dict{Dict{Int64, Int64}, Bool}()

function solve!(moneys, d)
    if d == 0
        return true
    end
    if d < 0
        return false
    end
    if haskey(moneys, table)
        return table[moneys]
    end
    for key in keys(moneys)
        tmp = moneys[key]
        for j in 1:moneys[key]
            moneys[key] = j 
            table[moneys] = solve!(moneys, d - (tmp - j) * key)
        end
    end
    return false
end


            

function main()
    N, X = parse.(Int, split(readline()))
    moneys = Dict{Int, Int}()
    for i in 1:N
        a, b = parse.(Int, split(readline()))
        moneys[a] = b
    end
    for (m, n) in moneys
        @show m
        for i in 2:50
            if haskey(moneys, m * i) && n >= i
                moneys[m] -= i * (n ÷ i)
                moneys[m * i] += n ÷ i
            end
        end
    end
    println(solve!(moneys, X))
end

main()