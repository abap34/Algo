using Primes

function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    _A = Int[]
    ans = 0

    for i in eachindex(A)
        if A[i] == 0
            ans += (N - i)
        else
            push!(_A, A[i])
        end
    end

    A = _A

    C = Dict{Vector{Bool},Int}()

    primevec = primes(maximum(A))

    n = length(primevec)

    cashe = Dict{Int,Int}()

    function prime_to_index(p)
        if haskey(cashe, p)
            return cashe[p]
        end

        return cashe[p] = searchsortedfirst(primevec, p)
    end

    fmat = zeros(Bool, n, length(A))

    for (i, a) in enumerate(A)
        f = factor(a)

        for (p, e) in f
            fmat[prime_to_index(p), i] = isodd(e)
        end
    end

    i = 1
    println(length(fmat[:, i]))

    for i in 1:length(A)
        C[fmat[:, i]] = get(C, fmat[:, i], 0) + 1
    end
    

    for (_, v) in C
        ans += v * (v - 1) ÷ 2
    end

    println(ans)


end

main()