parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function f(A,B,x)
    return div(A * x , B) - A * (div(x , B))
end

function main()
    A,B,N = parseMap(split(readline()))
    x = min(N,B-1)
    println(max(f(A,B,x),f(A,B,x)))
end




main()