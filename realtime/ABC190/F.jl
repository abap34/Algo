parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
using DataStructures



function f(a)
    result = 0

    tree = FenwickTree{Int}(300000)

    for i in 1:length(a)
        result += i - prefixsum(tree, a[i])        
        inc!(tree, a[i], i)
        @show result
    end

    return result
end


function main()
    N = parseInt(readline())
    a = parseMap(split(readline()))
    
    base_t = f(a)

    for i in 1:N
        