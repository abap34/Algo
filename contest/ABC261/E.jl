struct TruthTable
    n :: Int
    out :: Vector{Union{Nothing, Bool}}
    function TruthTable(n, out)
        new(n, y)
    end
end

function main()
    cashe = Dict{Tuple{Int, Int}, TruthTable}()
    N, C = parse.(Int, split(readline()))
    T = zeros(Int, N)
    A = zeros(Int, N)
    C = digits(N, base=2)
    for i in 1:N
        t, a = parse.(Int, split(readline()))
        T[i] = t
        A[i] = a
    end
    
    for i in 1:N
        t = T[i]
        if t == 1
            C = C 
end

main()