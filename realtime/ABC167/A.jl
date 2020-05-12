parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

S = chomp(readline())
T = chomp(readline())
if S == T[1:length(S)]
    println("Yes")
else
    println("No")
end