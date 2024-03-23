parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,A,B = parseMap(split(readline()))
ans = 0
set_count = div(N,A + B)
nokori  = N % (A + B)
ans += A * set_count
ans += minimum([A,nokori])        

println(ans)