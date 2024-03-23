parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
N,K = parseMap(split(readline()))

snuke_list = zeros(N)
for i in 1:K
    d = parseInt(readline())
    A = parseMap(split(readline()))
    for a in A
        snuke_list[a] = 1
    end
end
ans = 0
for s in snuke_list
    if s == 0
        ans += 1
    end
end
println(ans)
end

main()