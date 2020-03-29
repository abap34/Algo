parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
X = parseMap(split(readline()))
sort!(X)

best_sum = 10000000000
for i in X[1]:X[N]
    sum = 0
    for x in X
        sum += (x - i) ^ 2
    end
    if sum < best_sum
        best_sum = sum
    end
end            
println(best_sum)