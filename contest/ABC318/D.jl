using Printf



function main()
    N = parse(Int, readline())
    D = zeros(Int, N, N)
    for i in 1:N-1
        d = parse.(Int, split(readline()))
        for j in eachindex(d)
            D[i, i+j] = d[j]
            D[i+j, i] = d[j]
        end
    end
    
end


main()