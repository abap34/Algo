parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
L, R, d = parseMap(split(readline()))

ans = 0
for i in L:R
    if i % d == 0
        ans += 1
    end
end

println(ans)

end

main()