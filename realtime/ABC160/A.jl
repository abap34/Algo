parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

S = readline()
if S[3] == S[4] && S[5] == S[6]
    println("Yes")
else
    println("No")
end