parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function isOk(A, x)
    for a in A
        if a < x
            return false
        end
    end
    return true
end

function main()
N, M, X = parseMap(split(readline()))

C = zeros(Int, N)
A = fill([], N)
for i in 1:N
    line =  parseMap(split(readline()))
    C[i] = line[1]
    A[i] = line[2:end]
end

min_money = 10^7

for i in 0:2^N - 1
    R = zeros(Int, M)
    m = 0
    P = digits(i, base=2, pad=N)
    for j in 1:N
        p = P[j]
        if p == 0
            m += C[j]
            for k in 1:M
                R[k] += A[j][k]
            end
        end
    end
    if isOk(R, X)
        if m < min_money
            min_money = m
        end
    end
end

println(min_money == 10^7 ? -1 : min_money)
end

main()

