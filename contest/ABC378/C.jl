function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    last_idx = Dict{Int, Int}()

    B = similar(A)

    for i in 1:N
        a = A[i]
        if haskey(last_idx, a)
            B[i] = last_idx[a]
            last_idx[a] = i
        else
            B[i] = -1
            last_idx[a] = i
        end
    end


    println(join(B, " "))
end

main()