parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N, M = parseMap(split(readline()))

L = []
R = []

max_l = -1
min_r = 10^5 + 1


for _ in 1:M
    l, r = parseMap(split(readline()))
    max_l = max(max_l, l)
    min_r = min(min_r, r) 
end

println(max(min_r - max_l + 1, 0))

end


main()

