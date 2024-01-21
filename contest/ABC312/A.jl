function main()
    N = collect(readline())
    N = parse.(Int, N)
    for i in 1:length(N)-1
        if N[i+1] >= N[i]
            println("No")
            return
        end
    end
    println("Yes")
end

main()