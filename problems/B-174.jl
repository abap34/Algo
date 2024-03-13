parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N, D = parseMap(split(readline()))

count = 0
for _ in 1:N
    x, y = parseMap(split(readline()))
    d = x^2 + y^2
    if d <= D^2
        count += 1
    end
end


println(count)
end

main()