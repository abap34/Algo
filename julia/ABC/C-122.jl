parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, Q = parseMap(split(readline()))
    S = collect(chomp(readline()))
    A = zeros(Int, length(S))
    for i in 1:N-1
        if S[i:i+1] == ['A', 'C']
            A[i + 1] = A[i] + 1
        else
            A[i + 1] = A[i]
        end
    end
    for _ in 1:Q
        l, r = parseMap(split(readline()))
        println(A[r] - A[l])
    end
end



main()