parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

K,N = parseMap(split(readline()))
A = parseMap(split(readline()))

function main()
    
before_a = 0
shortest_aida = -100000
for a in A
    aida = a - before_a
    before_a  = a
    if aida > shortest_aida
        shortest_aida = aida
    end
end

if A[1] + (K - A[N]) > shortest_aida
    shortest_aida = A[1] + (K - A[N])
end

println(K - shortest_aida)
end

main()