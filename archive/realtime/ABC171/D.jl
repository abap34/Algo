parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
N = readline()
A = parseMap(split(readline()))
Q = parseInt(readline())


D = Dict{Int, Int}()

before_sum = sum(A)
for a in A
    if a in keys(D)
        D[a] += 1
    else
        D[a] = 1
    end
end


for _ in 1:Q
    B, C = parseMap(split(readline()))
    if B in keys(D)
        before_sum += D[B] * (C - B)
    else
        println(before_sum)
        continue
    end
    if C in keys(D)
        D[C] += D[B]
    else
        D[C] = D[B]
    end
    D[B] = 0
    println(before_sum)
end
end

main()
