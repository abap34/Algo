parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

using DataStructures

function main()
    N, M = parseMap(split(readline()))
    D = SortedDict{Int, Int}()
    for _ in 1:N
        A, B = parseMap(split(readline()))
        if haskey(D, A)
            D[A] += B
        else
            D[A] = B
        end
    end
    count = 0
    money = 0
    for d in D
        if M - count >= d[2]
            count += d[2]
            money += d[1] * d[2]
        elseif 0 < M - count < d[2]
            money += d[1] * (M - count)
            break
        else
            break
        end
    end
    println(money)
end


main()