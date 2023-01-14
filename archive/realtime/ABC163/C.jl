parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())
A = parseMap(split(readline()))
people = zeros(Int,N)
for a in A
    people[a] += 1
end

for p in people
    println(p)
end