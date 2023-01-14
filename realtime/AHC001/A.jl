parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    X = Array{Int64, 1}(undef, N)
    Y = Array{Int64, 1}(undef, N)
    R = Array{Int64, 1}(undef, N)
    for i in 1:N
        x, y, r = parseMap(split(readline()))
        X[i] = x
        Y[i] = y
        R[i] = r
    end
end


@time main()