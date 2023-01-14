parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parseMap(split(readline()))
A = parseMap(split(readline()))
sum_A = sum(A)
ans = 0 
for a in A
    if  a >= sum_A / 4M 
        ans += 1
    end
end

println(ans >= M ? "Yes" :  "No")