function solve(N, M, B, C)
    max_B = maximum(B)
    min_B = minimum(B)
    if max_B - min_B <= 10^3
        return naive(N, M, B, C)
    end

    

end



function main()
    N, M = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    C = parse.(Int, split(readline()))

    if N * M <= 10^8
        result = naive(N, M, B, C)
    else
        result = solve(N, M, B, C)
    end
end

main()