parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()


N = parseInt(readline())

W = parseMap(split(readline()))

min_abs = 100000

for i in 1:N-1
    min_abs = min(min_abs, abs(sum(W[1:i]) - sum(W[i+1:N])))
end


println(min_abs)

end

main()