parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N = parseInt(readline())
S(N) = sum(digits(N))

println(N % S(N) == 0 ? "Yes" : "No")