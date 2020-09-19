parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

S = collect(chomp(readline()))


if S[end] == 's'
    push!(S, 'e', 's')
else
    push!(S, 's')
end


for s in S
    print(s)
end

println()