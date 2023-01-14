parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

A, B, H, M = parseMap(split(readline()))


h = 30H + 0.5M

m = 6M

r = abs(h - m)
ans = sqrt(A^2 + B^2 - (2 * A * B * cosd(r)))

println(ans)