parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
S = chomp(readline())
if S[1] == S[2] == S[3]
    println("No")
else
    println("Yes")    
end    