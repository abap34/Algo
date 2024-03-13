parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function f(N, K)
    s = 0
    for n in 1:N
        if n < K
            s += 1 / (2^(ceil(log(2, K / n)))) 
        else
            s += 1
        end
    end
    return s / N 
end


function main()
    N, K = parseMap(split(readline()))
    println(f(N, K))
end

main()