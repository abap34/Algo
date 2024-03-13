parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
p = parseMap(split(readline()))
sort_p = sort(p)
count = 0
for i in 1:N
    if p[i] != sort_p[i]
        count += 1
    end
end      

println(count > 2 ? "YES":"NO")