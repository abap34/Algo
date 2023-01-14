function main()
    arr = ['A', 'T', 'G', 'C']
    N = 5000
    idx = rand(1:4, N)
    S = ""
    for i in idx
        S *= arr[i]
    end
    # @show S
    open("input.txt", "w") do io
        write(io, "$N $S\n")
    end
end


main()