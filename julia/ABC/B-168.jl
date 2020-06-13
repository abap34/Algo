parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

K = parseInt(readline())
S = chomp(readline())

if length(S) <= K
    println(S)
else
    println("$(S[1:K])...")
end