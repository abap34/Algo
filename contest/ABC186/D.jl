parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    sort!(A)
    # A = rand(1:10, N)
    S = zeros(Int, N + 1)
    S[1] = 0
    for i in 1:N
        S[i + 1] = S[i] + A[i]
    end
    ans = 0
    for i in 2:N
        base = A[i] * (i - 1)
        ans += abs(base - S[i])
    end
    println(ans)
end

main()