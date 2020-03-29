parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N = parseInt(readline())
A = parseMap(split(readline()))

dict = Dict{Int,Int}()
memo = Dict{Int,Int}()

for a in A
    if a in keys(dict)
        dict[a] += 1
    else
        dict[a] = 1

    end
end

base_ans = 1
#println(dict)
for i in values(dict)
    base_ans += (i^2 - i) ÷ 2
end
#println(base_ans)
#println()
for a in A
    if a in keys(memo)
        println(memo[a])
    else
        ans = base_ans - dict[a] 
        memo[a] = ans
        println(ans)
    end
end