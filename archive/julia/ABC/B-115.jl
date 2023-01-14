parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
P = []
for i in 1:N
    p = parse(readline())
    push!(P,p)
end

sort!(P)

P[N] = P[N] ÷ 2

println(sum(P))